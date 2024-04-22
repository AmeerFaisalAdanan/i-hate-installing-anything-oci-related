@echo off
echo Downloading InstantClient and PHP Extension
call download.bat
echo.
echo Unzipping . . . . 
call unzip.bat
echo.
echo Moving files and setting up environment
call move.bat
echo.
echo All scripts executed.
