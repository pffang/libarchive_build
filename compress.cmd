set ROOT=%~dp0
echo %ROOT%

if exist stage\bin (
    cd stage\bin
    copy ..\version.txt .\
    tar -cJf libarchive_prebuilt_win_x64.tar.xz archive.dll bsdcat.exe bsdcpio.exe bsdtar.exe version.txt
    cd %ROOT%
)
