set TEMP=%~dp0
echo %TEMP%
SET "ROOT=%TEMP:\=/%"
echo %ROOT%

if not exist build\xz (
    git clone --depth=1 -b master --single-branch https://github.com/tukaani-project/xz.git build\xz
) else (
    cd build\xz
    git pull --depth 1
    cd %ROOT%
)

if exist build\xz (
    cmake -A x64 --install-prefix %~dp0stage -S build/xz -B build/xz_build -D CMAKE_BUILD_TYPE="Release" -D ENABLE_NLS=OFF -D BUILD_SHARED_LIBS=OFF -D XZ_DOC=OFF -D XZ_TOOL_LZMADEC=OFF -D XZ_TOOL_LZMAINFO=OFF -D XZ_TOOL_XZ=OFF -D XZ_TOOL_XZDEC=OFF -D XZ_TOOL_SCRIPTS=OFF
    cmake --build build/xz_build --target INSTALL --config Release
)
