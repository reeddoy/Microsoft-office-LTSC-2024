

@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

title Activate Microsoft Office LTSC Professional Plus 2024 !
cls
echo ============================================================================
echo #Project: Activating Microsoft software products
echo #Developed By Arif Elahi Redoy
echo #CoderXen LLC
echo #Github: https://github.com/reeddoy
echo ============================================================================
echo.
echo #Supported products:
echo - Microsoft Office LTSC Professional Plus 2024
echo.
echo.

setlocal enabledelayedexpansion

:: Find an active KMS server from the list
set "active_server="
set /a invalid_count=0

if not exist "%~dp0server_list.txt" (
    echo ERROR: server_list.txt not found
    goto :eof
)

for /f "usebackq tokens=* delims=" %%a in ("%~dp0server_list.txt") do (
    if not "%%a"=="" (

        ping -n 1 -w 1000 %%a | findstr /i "TTL=" >nul

        if !errorlevel! equ 0 (
            set "active_server=%%a"
            goto :found_server
        ) else (
            set /a invalid_count+=1
            echo Invalid Server [!invalid_count!]: %%a
        )
    )
)

:found_server

if defined active_server (
    echo.
    echo ==========================================
    echo Active Server  : !active_server!
    echo Invalid Servers: !invalid_count!
    echo ==========================================
) else (
    echo.
    echo No active server found.
    echo Total Invalid Servers: !invalid_count!
)


if not defined active_server (
    echo No active server found. Please check your internet connection or update the server list.
    pause >nul
    exit /b
)

if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" (
    cd /d "%ProgramFiles%\Microsoft Office\Office16"
    echo.
    echo ============================================================================
    echo Activating your Office using server: !active_server!
    cscript ospp.vbs /sethst:!active_server!
    echo ============================================================================
    echo.
    echo.
    cscript ospp.vbs /act
) else (
    echo Microsoft Office LTSC Professional Plus 2024 not installed. Please run the installation script first.
    echo.
    echo.
)
echo ============================================================================
echo #Please feel free to contact me at reeddoy@gmail.com if you have any questions or concerns.
echo ============================================================================
choice /n /c YN /m "Would you like to visit my Page [Y,N]?" 
if %errorlevel%==1 (
    explorer "https://github.com/reeddoy"
) else (
    exit
)
pause >nul