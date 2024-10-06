if not exist zlib (
    git clone --depth=1 --branch v1.3.1 https://github.com/madler/zlib.git
)

cmake -G "Visual Studio 17 2022" -A x64 --install-prefix %~dp0stage -S zlib -B zlib_build -DZLIB_BUILD_EXAMPLES=OFF
cmake --build zlib_build --target INSTALL --config Release
