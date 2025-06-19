@echo off
adb shell "su -c 'dmesg -w'"
echo.
pause >nul
goto loop
