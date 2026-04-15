@echo off
setlocal

set BASEDIR=%~dp0
echo %BASEDIR%
SET "ROOT=%BASEDIR:\=/%"
echo %ROOT%

set VERSION=v1.5.7

if not exist build\zstd (
    git clone --depth=1 -b %VERSION% --single-branch https://github.com/facebook/zstd.git build\zstd
    if errorlevel 1 exit /b 1
) else (
    cd build\zstd
    git fetch --all --unshallow
    git checkout -b temp %VERSION%
    git reset --hard %VERSION%
    git clean -fdx
    cd "%BASEDIR%"
)

if exist build\zstd (
    cmake -A x64 --install-prefix "%ROOT%stage" -S build/zstd/build/cmake -B build/zstd_build -D CMAKE_BUILD_TYPE="Release" -D ZSTD_BUILD_STATIC=ON -D ZSTD_BUILD_SHARED=OFF -D ZSTD_BUILD_PROGRAMS=OFF -D ZSTD_BUILD_TESTS=OFF -D ZSTD_BUILD_CONTRIB=OFF
    cmake --build build/zstd_build --target ALL_BUILD --config Release
    cmake --build build/zstd_build --target INSTALL --config Release
)

endlocal
