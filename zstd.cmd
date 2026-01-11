set TEMP=%~dp0
echo %TEMP%
SET "ROOT=%TEMP:\=/%"
echo %ROOT%

if not exist zstd (
    git clone --depth=1 --branch v1.5.7 https://github.com/facebook/zstd.git
)

if exist zstd (
    cd zstd
    git checkout -b temp v1.5.7
    cd %ROOT%
)

cmake -A x64 --install-prefix %~dp0stage -S zstd/build/cmake -B zstd_build -D CMAKE_BUILD_TYPE="Release" -D ZSTD_BUILD_STATIC=ON -D ZSTD_BUILD_SHARED=OFF -D ZSTD_BUILD_PROGRAMS=OFF -D ZSTD_BUILD_TESTS=OFF -D ZSTD_BUILD_CONTRIB=OFF
cmake --build zstd_build --target INSTALL --config Release
