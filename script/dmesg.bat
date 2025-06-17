@echo off
adb shell "su -c 'dmesg -w | grep kernel'"
echo.
pause >nul
goto loop
