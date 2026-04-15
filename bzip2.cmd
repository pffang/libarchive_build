@echo off
setlocal

set BASEDIR=%~dp0
echo %BASEDIR%
SET "ROOT=%BASEDIR:\=/%"
echo %ROOT%

if not exist build\bzip2 (
    git clone --depth=1 -b master --single-branch https://gitlab.com/bzip2/bzip2.git build\bzip2
    if errorlevel 1 exit /b 1
) else (
    cd build\bzip2
    git pull
    cd "%BASEDIR%"
)

if exist build\bzip2 (
    cmake -A x64 --install-prefix "%ROOT%stage" -S build/bzip2 -B build/bzip2_build -D CMAKE_BUILD_TYPE="Release" -D ENABLE_LIB_ONLY=ON -D ENABLE_SHARED_LIB=OFF -D ENABLE_STATIC_LIB=ON
    cmake --build build/bzip2_build --target INSTALL --config Release
)

endlocal
