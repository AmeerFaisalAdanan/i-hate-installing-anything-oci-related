@echo off
setlocal

set "url_basic=https://download.oracle.com/otn_software/nt/instantclient/1922000/instantclient-basic-windows.x64-19.22.0.0.0dbru.zip"
set "output_file_basic=instantclient-basic-windows.x64-19.22.0.0.0dbru.zip"

set "url_sqlplus=https://download.oracle.com/otn_software/nt/instantclient/1922000/instantclient-sqlplus-windows.x64-19.22.0.0.0dbru.zip"
set "output_file_sqlplus=instantclient-sqlplus-windows.x64-19.22.0.0.0dbru.zip"

set "url_php_oci8=https://downloads.php.net/~windows/pecl/releases/oci8/3.2.1/php_oci8-3.2.1-8.1-ts-vs16-x64.zip"
set "output_file_php_oci8=php_oci8-3.2.1-8.1-ts-vs16-x64.zip"

curl -O -J -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "%url_basic%"
curl -O -J -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "%url_sqlplus%"
curl -O -J -L "%url_php_oci8%"

:end
