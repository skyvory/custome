@echo off
for /d %%G in (*) do (
  @REM cd %%G
  winrar a -r -ep1 -s -rr1p -t -IBCK -ts -x*Thumbs.db "%%G.rar" "%%G\*"
  @REM cd ..
)
pause