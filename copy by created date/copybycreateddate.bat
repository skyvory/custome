@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
SET "sourcedir=."

set /p thresholddate="Enter threshold date: "
set defaultthresholddate=211127

FOR /f "delims=" %%a IN (
 'dir /b /a-d /s "%sourcedir%\*.*" '
 ) DO (
  @REM  echo DEBUG: %%~nxa
  @REM  %%a : full path (because the recursive /s switch, would be just name and extension without /s)
  @REM  ~nx : name and extension
  @REM  ~f : full path
   
 CALL :creationdate "%%a" c crdatetime
 CALL :creationdate "%%a" w wrdatetime
 CALL :creationdate "%%a" a acdatetime
@REM  ECHO DEBUG: !crdatetime! !wrdatetime! !acdatetime! %%a

@REM set datecreated=!crdatetime!

SET datecreated=!crdatetime!
@REM set /A position=3, position2=position+1
@REM echo !datecreated:~0,%position%!!datecreated:~%position2%!
set datecreated=!datecreated:~0,2!!datecreated:~3,2!!datecreated:~6,2!
    ECHO !datecreated!  %%~nxa

if "%thresholddate%" == "" (
  if !datecreated! gtr !defaultthresholddate! (
    echo copying %%~nxa
    copy /v /y "%%a" "%sourcedir%\..\###\%%~nxa" 
  ) else (
    echo skipped %%~nxa - created date is older than threshold
  )
) else (
  if !datecreated! gtr !thresholddate! (
    echo copying %%a
    copy /v /y "%%a" "%sourcedir%\..\###\%%~nxa" 
  ) else (
    echo skipped %%~nxa - created date is older than threshold
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
