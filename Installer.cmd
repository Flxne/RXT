@echo off

echo.

echo.
echo Starting RXT installation...
echo.

for /d %%i in ("%localappdata%\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files (x86)\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

:NextStep
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)

echo Downloading ClientAppSettings.json file...
powershell.exe -Command "& {(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Flxne/RXT/main/ClientAppSettings.json', '%folder%\ClientSettings\ClientAppSettings.json')}"
if %errorlevel% EQU 0 (
    echo ClientAppSettings.json downloaded successfully!
    echo.
    echo SUCCESS: RXT installation completed!
) else (
    echo Failed to download ClientAppSettings.json. Please report this issue in DM at @fl1n3 on Telegram.
    echo.
    echo ERROR: RXT installation failed!
)

echo.
echo NOTE:
echo.
echo 1. Run this script every time there is a Roblox update!
echo.
echo 2. If you need help, contact @fl1n3 on Telegram!
echo.
echo 3. To uninstall RXT at any time, run RXT-Uninstaller.cmd!
echo.
echo.
echo Press any key to continue... & pause >nul