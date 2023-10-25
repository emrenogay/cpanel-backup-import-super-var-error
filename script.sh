#!/bin/bash

MYSQL_ROOT_PASSWORD="" #Your MySQL Root Pass Here

# Step 1: Export the folders in the "/home" directory to an array.
directories=(/home/*/)
echo "Klasörler diziye aktarıldı."

# Step 2: Loop the array
for dir in "${directories[@]}"; do
  echo "Şu anki klasör: $dir"

  # Step 3: Check a folder starting with "cpmove_failed_mysql".
  for failed_dir in "${dir}cpmove_failed_mysql"*; do
    if [ -d "$failed_dir" ]; then
      echo "'$failed_dir' klasörü bulundu."

      # 4. Adım: Find largest ".sql" file and import that
      largest_sql_file=$(find "$failed_dir" -maxdepth 1 -type f -name "*.sql" -printf "%s %p\n" | sort -nr | head -n1 | cut -d' ' -f2-)
      if [ -n "$largest_sql_file" ]; then
        echo "En büyük '.sql' uzantılı dosya bulundu: $largest_sql_file"

        wp_config_file="${dir}public_html/wp-config.php"
        if [ -f "$wp_config_file" ]; then
          echo "'wp-config.php' dosyası bulundu."

          # 5. Adım: Get DB settings from wp-config.php
          DB_NAME=$(grep -oP "define\(\s*'DB_NAME',\s*'[^']*'\s*\);" "$wp_config_file" | cut -d "'" -f 4)
          DB_USER=$(grep -oP "define\(\s*'DB_USER',\s*'[^']*'\s*\);" "$wp_config_file" | cut -d "'" -f 4)
          DB_PASSWORD=$(grep -oP "define\(\s*'DB_PASSWORD',\s*'[^']*'\s*\);" "$wp_config_file" | cut -d "'" -f 4)

          # 6. Adım: Create a db and give privileges. 
          mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME; GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost' WITH GRANT OPTION; FLUSH PRIVILEGES;"

          # 7. Adım: Import db.
          if mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$DB_NAME" < "$largest_sql_file"; then
            echo "$largest_sql_file dosyası veritabanına başarıyla içe aktarıldı."
          else
            echo "$largest_sql_file dosyasını veritabanına içe aktarırken bir hata oluştu. Script sonlandırılıyor."
            exit 1
          fi
        else
          echo "'wp-config.php' dosyası bulunamadı. Bir sonraki klasöre geçiliyor."
        fi
      else
        echo "'.sql' uzantılı dosya bulunamadı. Bir sonraki klasöre geçiliyor."
      fi
    else
      echo "'$failed_dir' klasörü bulunamadı. Bir sonraki klasöre geçiliyor."
    fi
  done
done

echo "Tüm işlemler tamamlandı."
