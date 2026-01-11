set TEMP=%~dp0
echo %TEMP%
SET "ROOT=%TEMP:\=/%"
echo %ROOT%

if not exist build\zstd (
    git clone --depth=1 -b dev --single-branch https://github.com/facebook/zstd.git build\zstd
) else (
    cd build\zstd
    git pull --depth 1
    cd %ROOT%
)

if exist build\zstd (
    cmake -A x64 --install-prefix %~dp0stage -S build/zstd -B build/zstd_build -D CMAKE_BUILD_TYPE="Release" -D ZSTD_BUILD_STATIC=ON -D ZSTD_BUILD_SHARED=OFF -D ZSTD_BUILD_PROGRAMS=OFF -D ZSTD_BUILD_TESTS=OFF -D ZSTD_BUILD_CONTRIB=OFF
    cmake --build build/zstd_build --target ALL_BUILD --config Release
    cmake --build build/zstd_build --target INSTALL --config Release
)
