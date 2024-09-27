set ROOT=%~dp0
echo %ROOT%

cd zlib
echo zlib version: > ../stage/version.txt
git show -s --format="%%h" >> ../stage/version.txt
cd %ROOT%

cd bzip2
echo bzip2 version: >> ../stage/version.txt
git show -s --format="%%h" >> ../stage/version.txt
cd %ROOT%

cd xz
echo xz version: >> ../stage/version.txt
git show -s --format="%%h" >> ../stage/version.txt
cd %ROOT%

cd zstd
echo zstd version: >> ../stage/version.txt
git show -s --format="%%h" >> ../stage/version.txt
cd %ROOT%

cd libarchive
echo libarchive version: >> ../stage/version.txt
git show -s --format="%%h" >> ../stage/version.txt
cd %ROOT%
