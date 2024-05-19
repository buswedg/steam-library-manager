@echo off
set "SCRIPT_PATH=%~dp0Update-All-Installed-Games-To-Update-Only-When-Launched.ps1"
net session >nul 2>&1
if %errorlevel% equ 0 (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%"
    pause
) else (
    echo Script must be run with Administrator privileges.
    pause
)