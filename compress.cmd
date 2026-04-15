@echo off
setlocal

set BASEDIR=%~dp0
echo %BASEDIR%

if exist stage\bin (
    cd stage\bin
    copy ..\version.txt .\
    tar -caf libarchive_prebuilt_win_x64.zip archive.dll bsdcat.exe bsdcpio.exe bsdtar.exe version.txt
    cd "%BASEDIR%"
)

endlocal
