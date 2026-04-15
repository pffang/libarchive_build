@echo off
setlocal

set BASEDIR=%~dp0
SET "ROOT=%BASEDIR:\=/%"

cd build/zlib
echo zlib version: > "%ROOT%stage/version.txt"
git show -s --format="%%h" >> "%ROOT%stage/version.txt"
cd "%BASEDIR%"

cd build/bzip2
echo bzip2 version: >> "%ROOT%stage/version.txt"
git show -s --format="%%h" >> "%ROOT%stage/version.txt"
cd "%BASEDIR%"

cd build/xz
echo xz version: >> "%ROOT%stage/version.txt"
git show -s --format="%%h" >> "%ROOT%stage/version.txt"
cd "%BASEDIR%"

cd build/zstd
echo zstd version: >> "%ROOT%stage/version.txt"
git show -s --format="%%h" >> "%ROOT%stage/version.txt"
cd "%BASEDIR%"

cd build/libarchive
echo libarchive version: >> "%ROOT%stage/version.txt"
git show -s --format="%%h" >> "%ROOT%stage/version.txt"
cd "%BASEDIR%"

endlocal
