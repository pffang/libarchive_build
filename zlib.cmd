set TEMP=%~dp0
echo %TEMP%
SET "ROOT=%TEMP:\=/%"
echo %ROOT%

if not exist zlib (
    git clone --depth=1 --branch v1.3.1 https://github.com/madler/zlib.git
)

if exist zlib (
    cd zlib
    git checkout -b temp v1.3.1
    cd %ROOT%
)

cmake -A x64 --install-prefix %~dp0stage -S zlib -B zlib_build -DZLIB_BUILD_EXAMPLES=OFF
cmake --build zlib_build --target INSTALL --config Release
