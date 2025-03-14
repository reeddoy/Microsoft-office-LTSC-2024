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
if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" (
    cd /d "%ProgramFiles%\Microsoft Office\Office16"
    echo.
    echo ============================================================================
    echo Activating your Office...
    cscript ospp.vbs /sethst:ksm.03k.org
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