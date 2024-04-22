@echo off
setlocal

set "instant_client_zip_file=instantclient-basic-windows.x64-19.22.0.0.0dbru.zip"
set "sqlplus_zip_file=instantclient-sqlplus-windows.x64-19.22.0.0.0dbru.zip"
set "php_oci8_zip_file=php_oci8-3.2.1-8.1-ts-vs16-x64.zip"


set "instantclient_unzip_dir=%cd%\instantclient"
set "sqlplus_unzip_dir=%cd%\sqlplus"
set "oci8_unzip_dir=%cd%\php_oci8"

if not exist "%instantclient_unzip_dir%" (
    mkdir "%instantclient_unzip_dir%"
)
if not exist "%sqlplus_unzip_dir%" (
    mkdir "%sqlplus_unzip_dir%"
)
if not exist "%oci8_unzip_dir%" (
    mkdir "%oci8_unzip_dir%"
)

bin\unzip.exe "%instant_client_zip_file%" -d "%instant_unzip_dir%"
bin\unzip.exe "%sqlplus_zip_file%" -d "%sqlplus_unzip_dir%"
bin\unzip.exe "%php_oci8_zip_file%" -d "%oci8_unzip_dir%"


rem Remove all .pdb files
for /r "%oci8_unzip_dir%" %%f in (*.pdb) do (
    del "%%f"
)

echo Unzipping and removing .pdb files completed.

