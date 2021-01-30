echo off
set FECHA=%date:/=-%
echo %FECHA%
cd C:\wamp64\bin\mariadb\mariadb10.4.10\bin
mysqldump -hlocalhost -uroot -proot hulk > C:\wamp64\www\asic\backup_DB\copia_seguridad_%FECHA%.sql
#mysqldump -hlocalhost -uroot -p
#mysqldump -user=root –password=
exit
