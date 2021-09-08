:: processing of graphical encrypted obfuscation computer generated visualization extraction
:: put this file with execution file of choice on the same folder with files to convert
@echo off

setlocal enableextensions enabledelayedexpansion

set count=0
set pattern=*.mp3


mkdir out

for %%f in (in\*.mp3) do (
	start /B /wait ffmpeg -loop 1 -i soundonly.jpg -i "%%f" -c:a copy -c:v libx264 -shortest "out\%%~nf.mp4"
	echo OK
)

echo conversion completed
echo closing in 3 seconds...
TIMEOUT /T 3
EXIT /B