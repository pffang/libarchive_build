set TEMP=%~dp0
echo %TEMP%
SET "ROOT=%TEMP:\=/%"
echo %ROOT%

set VERSION=v1.5.7

if not exist build\zstd (
    git clone --depth=1 -b %VERSION% --single-branch https://github.com/facebook/zstd.git build\zstd
) else (
    cd build\zstd
    git fetch --all --unshallow
    git checkout -b temp %VERSION%
    git reset --hard %VERSION%
    git clean -fdx
    cd %ROOT%
)

if exist build\zstd (
    cmake -A x64 --install-prefix %~dp0stage -S build/zstd/build/cmake -B build/zstd_build -D CMAKE_BUILD_TYPE="Release" -D ZSTD_BUILD_STATIC=ON -D ZSTD_BUILD_SHARED=OFF -D ZSTD_BUILD_PROGRAMS=OFF -D ZSTD_BUILD_TESTS=OFF -D ZSTD_BUILD_CONTRIB=OFF
    cmake --build build/zstd_build --target ALL_BUILD --config Release
    cmake --build build/zstd_build --target INSTALL --config Release
)
