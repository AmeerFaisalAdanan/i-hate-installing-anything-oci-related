@echo off
set "sourceDir=sqlplus\instantclient_19_22"
set "destinationDir=instantclient_19_22"


set "oci8SourceDir=php_oci8"
set "oci8DestinationDir=C:\laragon\bin\php\php-8.1.10-Win32-vs16-x64\ext"


if not exist "%sourceDir%" (
    echo Source directory "%sourceDir%" not found.
    exit /b
)

if not exist "%destinationDir%" (
    echo Destination directory "%destinationDir%" not found.
    exit /b
)

xcopy "%sourceDir%\*" "%destinationDir%\" /s /e /i /y
if errorlevel 1 (
    echo An error occurred while copying files.
) else (
    echo Files copied successfully.
)


move "%destinationDir%" "C:\"


echo Moving files from %oci8SourceDir% to %oci8DestinationDir%...

if not exist "%oci8SourceDir%" (
    echo Source directory does not exist.
    exit /b 1
)

if not exist "%oci8DestinationDir%" (
    echo Destination directory does not exist.
    exit /b 1
)

echo Moving files...
move /Y "%oci8SourceDir%\*" "%oci8DestinationDir%"

if %errorlevel% neq 0 (
    echo Failed to move files.
    exit /b 1
)

echo Files moved successfully.


REM Relaunching cmd as administrator specifically for the setx command
echo Running setx command as administrator...
powershell -Command "Start-Process cmd.exe -ArgumentList '/c setx PATH \"%PATH%;C:\%destinationDir%\" /m' -Verb RunAs"

goto :eof

:noadmin
REM Re-launching the script with administrative privileges
echo Running script as administrator...
powershell -Command "Start-Process cmd.exe -ArgumentList '/c %~0' -Verb RunAs"
exit /b