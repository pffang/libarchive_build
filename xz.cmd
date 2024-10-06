if not exist xz (
    git clone --depth=1 --branch v5.6.3 https://github.com/tukaani-project/xz.git
)

cmake -G "Visual Studio 17 2022" -A x64 --install-prefix %~dp0stage -S xz -B xz_build -D CMAKE_BUILD_TYPE="Release" -D ENABLE_NLS=OFF -D ENABLE_SHARED_LIBS=OFF -D XZ_TOOL_XZ=OFF -D XZ_TOOL_XZDEC=OFF -D XZ_TOOL_SCRIPTS=OFF
cmake --build xz_build --target INSTALL --config Release
