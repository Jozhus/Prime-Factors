@echo off
setlocal enabledelayedexpansion
:START
cls
set num=0
set div=2
set yn=no
set count=1
set /p num=Enter a number: 
REM Batch number limits
if %num% LSS 1 echo Invalid number & pause & goto start
if %num%==1 set prime1=1 && goto Display
if %num% GTR 2147483647 echo Invalid number & pause & goto start
:LOOP
REM Checks if half the number is a decimal
set /a numcheck=%num%/%div%
REM setting the prime to a unique variable
set prime%count%=%numcheck%
set /a numcheck=%numcheck%*%div%
REM If half the number is a decimal, try dividing by a different number
if %div%==%num% set prime%count%=%num% & goto Display
if %num% NEQ %numcheck% (set /a div+=1 & goto Loop)
set div%count%=%div%
set num=!prime%count%!
set div=2
set /a count+=1
GOTO Loop
:DISPLAY
REM Counter intuitive way of avoiding errors.
set /a divcount=%count%-1
for /l %%a in (1,1,%divcount%) do echo !div%%a!
for /l %%a in (%count%,1,%count%) do echo !prime%%a!
pause
goto Start