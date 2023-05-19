@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
SET "sourcedir=."

set /p thresholddate="Enter threshold date: "
set defaultthresholddate=211127

FOR /f "delims=" %%a IN (
 'dir /b /a-d "%sourcedir%\*.wav" '
 ) DO (
 CALL :creationdate "%sourcedir%\%%a" c crdatetime
 CALL :creationdate "%sourcedir%\%%a" w wrdatetime
 CALL :creationdate "%sourcedir%\%%a" a acdatetime
@REM  ECHO !crdatetime! !wrdatetime! !acdatetime! %%a

@REM set datecreated=!crdatetime!

SET datecreated=!crdatetime!
@REM set /A position=3, position2=position+1
@REM echo !datecreated:~0,%position%!!datecreated:~%position2%!
set datecreated=!datecreated:~0,2!!datecreated:~3,2!!datecreated:~6,2!
    ECHO !datecreated!  %%a

if "%thresholddate%" == "" (
  if !datecreated! gtr !defaultthresholddate! (
    echo copying %%a
    copy /v /y "%%a" "###\%%a" 
  ) else (
    echo skipped %%a - created date is older than threshold
  )
) else (
  if !datecreated! gtr !thresholddate! (
    echo copying %%a
    copy /v /y "%%a" "###\%%a" 
  ) else (
    echo skipped %%a - created date is older than threshold
  )
)
    @REM ECHO !datecreated!  %%a
)

GOTO :EOF
@REM pause

:creationDate
for /f "skip=5 tokens=1,2 delims= " %%a in (
 'dir  /a:-d /o:d /t:%2 "%~1"') do set "%~3=%%~a %%~b"&goto:eof
goto:eof
