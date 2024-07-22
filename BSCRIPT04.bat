@echo off
color 0A
cls
setlocal
echo.
set "source=C:\"
set "destination=Z:\archive"
set "filetype=*.txt"
echo.
if not exist "%destination%" mkdir "%destination%"
echo.
forfiles /p "%source%" /m "%filetype%" /d -30 /c "cmd /c robocopy \"%source%\" \"%destination%\" @file >nul && if errorlevel 1 exit /b 0"
echo.
for /f "tokens=*" %%A in ('dir /s /b /o:s "%destination%\%filetype%"') do echo %%A
echo.
choice /C YN /M "Do you want to delete old, large files (Y/N)?"
if errorlevel 2 (
    echo Deletion cancelled.
) else (
    forfiles /p "%destination%" /m "%filetype%" /s /d -30 /c "cmd /c del @path"
)

endlocal