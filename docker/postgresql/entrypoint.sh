# sleep 50s
# /opt/mssql-tools/bin/sqlcmd -U "" -P "admin" -S 127.0.0.1 -b -i /docker-entrypoint-initdb.d/init.sql 
# /opt/mssql-tools/bin/sqlcmd -U "sa" -P "admin" -S 127.0.0.1 -b -i /docker-entrypoint-initdb.d/create-table.sql
# execute sqlfiles under directory
# for file in `\find /docker-entrypoint-initdb.d/mst-data -maxdepth 1 -type f`; do /opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U "sa" -P "admin" -b -i $file; done
