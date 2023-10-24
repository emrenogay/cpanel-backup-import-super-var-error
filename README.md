# Resolving 'Access Denied' Error 1227 in MySQL Database 'db_name' for Missing Privileges
Resolving 'Access Denied' Error 1227 in MySQL Database 'db_name' for Missing Privileges

If you get an error like "“MySQL” database “db_name”: 1227 (Access denied; you need (at least one of) the SUPER, SYSTEM_VARIABLES_ADMIN or SESSION_VARIABLES_ADMIN privilege(s)" while importing your cPanel backups, this bash script may solve your problem.

Note: It was written for WordPress websites and takes its database information from the wp-config.php file.

# Example Error

[ 40047][RESTORE:1 ][A:user       ]:               Invalid log entry: [Cpanel::Exception::Database::Error/(XID ge4kgu) The system received an error from the “MySQL” database “db_name”: 1227 (Access denied; you need (at least one of) the SUPER, SYSTEM_VARIABLES_ADMIN or SESSION_VARIABLES_ADMIN privilege(s) for this operation)\x0A at /usr/local/cpanel/Cpanel/DBI.pm line 200, <$rfh> line 18.\x0A\x09Cpanel::DBI::_create_exception(Cpanel::DBI::Mysql::db=HASH(0x2b7ad30), "DBD::mysql::db do failed: Access denied; you need (at least o"..., undef) called at /usr/local/cpanel/Cpanel/DBI.pm line 188\x0A\x09Cpanel::DBI::_error_handler("DBD::mysql::db do failed: Access denied; you need (at least o"..., Cpanel::DBI::Mysql::db=HASH(0x2b7ad30), undef) called at /usr/local/cpanel/Cpanel/Mysql/Restore/Client.pm line 456\x0A\x09Cpanel::Mysql::Restore::Client::_handle_one_delimited_mysql_statement(Cpanel::Mysql::Restore::Client=HASH(0x2846d68), SCALAR(0xbfc790), Cpanel::DBI::Mysql::db=HASH(0x2b7ad30)) called at /usr/local/cpanel/Cpanel/Mysql/Restore/Client.pm line 234\x0A\x09Cpanel::Mysql::Restore::Client::__ANON__() called at /usr/local/cpanel/Cpanel/Mysql/Restore/Client.pm line 271\x0A\x09Cpanel::Mysql::Restore::Client::run(__CPANEL_HIDDEN__, Cpanel::Output::Callback=HASH(0x28335e0), __CPANEL_HIDDEN__, GLOB(0x282a2b8), __CPANEL_HIDDEN__, __CPANEL_HIDDEN__, __CPANEL_HIDDEN__, __CPANEL_HIDDEN__, ...) called at bin/restore_mysql_for_account_restore.pl line 106\x0A\x09bin::restore_mysql_for_account_restore::__ANON__() called at /usr/local/cpanel/3rdparty/perl/536/cpanel-lib/Try/Tiny.pm line 100\x0A\x09eval {...} called at /usr/local/cpanel/3rdparty/perl/536/cpanel-lib/Try/Tiny.pm line 91\x0A\x09Try::Tiny::try(CODE(0x281bed0), Try::Tiny::Catch=REF(0xba0c00)) called at bin/restore_mysql_for_account_restore.pl line 119\x0A\x09bin::restore_mysql_for_account_restore::run(bin::restore_mysql_for_account_restore=HASH(0x282b170)) called at bin/restore_mysql_for_account_restore.pl line 62\x0A at bin/restore_mysql_for_account_restore.pl line 118, <$rfh> line 18.
[ 40047][RESTORE:1 ][A:db_user       ]:               ]
[ 40047][RESTORE:1 ][A:db_user       ]:               Invalid log entry: [Connecting to SQL server (/var/lib/mysql/mysql.sock) as “db_user” in order to restore “db_name” …
[ 40047][RESTORE:1 ][A:db_user       ]:               ]
[ 40047][RESTORE:1 ][A:db_user       ]:               Invalid log entry: [Disabling InnoDB strict mode for database restore for “db_name” …
[ 40047][RESTORE:1 ][A:db_user       ]:               ]
[ 40047][RESTORE:1 ][A:db_user       ]:               Invalid log entry: [Restoring database data for “db_name” …
[ 40047][RESTORE:1 ][A:db_user       ]:               ]
[ 40047][RESTORE:1 ][A:db_user       ]:               Invalid log entry: [Processing SQL statements …
[ 40047][RESTORE:1 ][A:db_user       ]:               ]
