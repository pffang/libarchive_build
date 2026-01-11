set TEMP=%~dp0
SET "ROOT=%TEMP:\=/%"

cd build/zlib
echo zlib version: > %ROOT%/stage/version.txt
git show -s --format="%%h" >> %ROOT%/stage/version.txt
cd %ROOT%

cd build/bzip2
echo bzip2 version: >> %ROOT%/stage/version.txt
git show -s --format="%%h" >> %ROOT%/stage/version.txt
cd %ROOT%

cd build/xz
echo xz version: >> %ROOT%/stage/version.txt
git show -s --format="%%h" >> %ROOT%/stage/version.txt
cd %ROOT%

cd build/zstd
echo zstd version: >> %ROOT%/stage/version.txt
git show -s --format="%%h" >> %ROOT%/stage/version.txt
cd %ROOT%

cd build/libarchive
echo libarchive version: >> %ROOT%/stage/version.txt
git show -s --format="%%h" >> %ROOT%/stage/version.txt
cd %ROOT%
