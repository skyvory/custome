:: Iterate through "(0000)" file names in a directory and noticing missing page.
:: Simply drag and drop folder/directory into this .bat file to execute
@echo OFF
cd /d %1
REM somehow cd /d %1 only works properly on directory with !!! on them when it's processed before setlocal
setlocal enableextensions enabledelayedexpansion
echo Working on %1

:loop

set count=1
set recheck=0

set /a iteration = 0
for %%i in (*) do (
	if %%i==failed.txt (
		echo skip failed txt
	) else (
		if %%i==tags.txt (
			echo skip tags txt
		) else (
			set /a iteration += 1
			set str=%%i
			set cut=!str:~1,4!
			set /a "cut=1!cut! %% 10000"
			if !iteration! == !cut! (
				echo !iteration!
			) else (
				set /a recheck=1
				echo !iteration! is a missing page
				pause
				REM goto loop
				REM add more iteration to match eager checking
				set /a iteration += 1
			)
		)
	)
  REM  !issue: consecutive missing pages would scramble missed page prediction
)
echo %recheck%
if %recheck%==1 (
	goto :loop
	echo yes
) else (
	echo no
)
echo ______
echo Pages complete^^!
echo|set /P ="Total files : !iteration!"
echo.
pause