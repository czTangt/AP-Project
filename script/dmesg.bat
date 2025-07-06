@echo off
:loop
::adb shell "su -c 'dmesg -w'"
adb shell "su -c 'dmesg -w'" | findstr "ap_kernel"
echo.
pause >nul
goto loop
