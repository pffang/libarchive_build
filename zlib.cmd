@echo off
setlocal

set BASEDIR=%~dp0
echo %BASEDIR%
SET "ROOT=%BASEDIR:\=/%"
echo %ROOT%

if not exist build\zlib (
    git clone --depth=1 -b develop --single-branch https://github.com/madler/zlib.git build\zlib
    if errorlevel 1 exit /b 1
) else (
    cd build\zlib
    git pull
    cd "%BASEDIR%"
)

if exist build\zlib (
    cmake -A x64 --install-prefix "%ROOT%stage" -S build/zlib -B build/zlib_build -D CMAKE_BUILD_TYPE="Release" -D ZLIB_BUILD_TESTING=OFF -D ZLIB_BUILD_SHARED=OFF -D ZLIB_BUILD_EXAMPLES=OFF
    cmake --build build/zlib_build --target INSTALL --config Release
)

endlocal
