@echo off
color 0A

:menu
cls
echo.
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo.
set /p shape="Choose a shape to use (1,2,3): "
if "%shape%"=="1" goto circle
if "%shape%"=="2" goto triangle
if "%shape%"=="3" goto quadrilateral
goto menu

:circle 
set /p radius="Enter the Radius of the circle: "
set /a area=3*radius*radius
echo The Area of the Circle is %area%
pause
goto menu

:triangle
set /p side1="Enter the 1st side of the triangle: "
set /p side2="Enter the 2nd side of the triangle: "
set /p side3="Enter the 3rd side of the triangle: "
if "%side1%"=="%side2%" if "%side2%"=="%side3%" echo The Triangle equilateral.
if "%side1%"=="%side2%" if "%side2%" neq "%side3%" echo The triangle is a isoceles.
if "%side1%" neq "%side2%" if "%side2%" neq "%side3%" echo The triangle is a scalene.
pause 
goto menu

:quadrilateral
set /p length="Enter the Length: "
set /p width="Enter the width: "
set /a area=length*width
echo The area of the quadrilateral is %area%
if "%length%"=="%width%" echo The quadrilateral is a square.
if "%length%" neq "%width%" echo The quadrilateral is a rectangle.
pause
goto menu