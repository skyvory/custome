for %%F in (*.wmv) do (
rem If not Exist "%%~nF" MkDir "%%~nF"
ffmpeg -i %%F -r 1 -qscale:v 2 %%~nF_%%3d.bmp
)
pause