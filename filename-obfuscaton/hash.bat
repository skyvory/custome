@echo off
setlocal enableDelayedExpansion

fciv -add "a.jpg" -sha1 > temp.txt

set /a iteration = 0
for /F "tokens=*" %%A in (temp.txt) do (
  set /a iteration += 1
  if !iteration! == 4 (
    echo %%A
    set str=%%A
    set cut=!str:~0,40!
    echo !cut!
  )
)

echo !cut!


pause