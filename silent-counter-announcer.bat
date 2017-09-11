@echo off
cd /d %1
setlocal enableextensions
set threshold=0;
:loop
set count=0
for %%i in (*) do set /a count+=1
echo %count%
if %count% == %threshold% (
  title %count%
) else (
  title !!!!!!!!!!!!!!!!
  ping 127.0.0.1 -n 2 > nul
  set /a threshold = %count%
)
title %count%
REM timeout /t 1
ping 127.0.0.1 -n 2 > nul
goto loop
endlocal