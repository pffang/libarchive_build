set TEMP=%~dp0
echo %TEMP%
SET "ROOT=%TEMP:\=/%"
echo %ROOT%

set VERSION=v1.3.1.2

if not exist build\zlib (
    git clone --depth=1 -b %VERSION% --single-branch https://github.com/madler/zlib.git build\zlib
) else (
    cd build\zlib
    git fetch --all --unshallow
    git checkout -b temp %VERSION%
    git reset --hard %VERSION%
    git clean -fdx
    cd %ROOT%
)

if exist build\zlib (
    cmake -A x64 --install-prefix %~dp0stage -S build/zlib -B build/zlib_build -D CMAKE_BUILD_TYPE="Release" -D ZLIB_BUILD_TESTING=OFF -D ZLIB_BUILD_SHARED=OFF -D ZLIB_BUILD_EXAMPLES=OFF
    cmake --build build/zlib_build --target INSTALL --config Release
)
