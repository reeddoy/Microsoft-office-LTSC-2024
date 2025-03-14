:: This script requires administrative privileges to run
@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrative privileges...
) else (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
title Download Microsoft Office LTSC Professional Plus 2024 !
echo.
echo.
echo ============================================================================
echo #Project: Download Microsoft Office LTSC Professional Plus 2024
echo #Developed By Arif Elahi Redoy
echo #CoderXen LLC
echo #Github: https://github.com/reeddoy
echo ============================================================================
echo.
echo.


:: Copy the office2024 folder to C:/ drive
xcopy "%~dp0office2024" "C:/office2024" /E /I /Y

:: Change directory to C:/office2024
cd /d C:/office2024

:: Run your command here
echo This script is running....
setup /configure configuration.xml