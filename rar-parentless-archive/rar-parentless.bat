@echo off
for /d %%G in (*) do (
  @REM cd %%G
  rar a -r -ep1 -s -rr1p -t  -ts -x*Thumbs.db "%%G.rar" "%%G\*"
  @REM cd ..
)
pause