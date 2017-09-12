@echo off
setlocal enableextensions enabledelayedexpansion

set directory=%~dp0

:again
if "%~1" == "" goto done

REM echo "%~n1"
REM echo "%~x1"

REM echo "%~1"
cd /d !directory!
fciv -add "%~1" -sha1 > temp~~~.txt

set /a iteration = 0
for /F "tokens=*" %%A in (temp~~~.txt) do (
  set /a iteration += 1
  if !iteration! == 4 (
    echo %%A
    set str=%%A
    set cut=!str:~0,40!
  )
)

REM echo !cut!

REM rename files to hash value
ren "%~1" "!cut!%~x1"
echo "new name: %~dp1!cut!%~x1"

REM rename txt to original file name
ren "temp~~~.txt" "%~nx1.inf"
move /Y "%~nx1.inf" "%~dp1"

shift
goto again
:done
pause
exit
