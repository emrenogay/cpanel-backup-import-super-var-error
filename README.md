# cpanel-backup-import-super-var-error
Resolving 'Access Denied' Error 1227 in MySQL Database 'db_name' for Missing Privileges

If you get an error like "“MySQL” database “db_name”: 1227 (Access denied; you need (at least one of) the SUPER, SYSTEM_VARIABLES_ADMIN or SESSION_VARIABLES_ADMIN privilege(s)" while importing your cPanel backups, this bash script may solve your problem.

Note: It was written for WordPress websites and takes its database information from the wp-config.php file.
