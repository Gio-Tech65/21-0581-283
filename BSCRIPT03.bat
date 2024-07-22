@echo off
color 0A

:menu
cls
echo.
echo ===============================
echo    Windows Utilities Menu
echo ===============================
echo 1. IP Config
echo 2. Task List / Task Kill
echo 3. Check Disk
echo 4. Format
echo 5. Defrag
echo 6. Find
echo 7. Attrib
echo 8. Exit
echo.
set /p choice=Enter your choice: 
goto option-%choice%

:option-1
ipconfig /all
pause
goto menu

:option-2
tasklist
set /p pid=Enter PID to kill: 
taskkill /PID %pid% /F
if %errorlevel% equ 0 (
    echo Task killed successfully.
) else (
    echo Failed to kill task. Please check the PID and try again.
)
pause
goto menu

:option-3
set /p drive=Enter drive letter to check: 
chkdsk %drive%: /f
pause
goto menu

:option-4
set /p drive=Enter drive letter to format: 
echo WARNING: All data on the drive will be lost!
set /p confirm=Are you sure you want to format the drive (Y/N)? 
if /I "%confirm%"=="Y" (
    format %drive%: /Q /X
) else (
    echo Format operation cancelled.
)
pause
goto menu

:option-5
set /p drive=Enter drive letter to defrag: 
defrag %drive%: /U /V
pause
goto menu

:option-6
set /p string=Enter string to find: 
findstr /S /I /M "%string%" *.*
pause
goto menu

:option-7
set /p file=Enter file path: 
attrib %file%
pause
goto menu

:option-8
exit

:option-
echo Invalid choice. Please try again.
pause
goto menu