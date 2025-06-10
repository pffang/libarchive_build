if not exist zstd (
    git clone --depth=1 https://github.com/facebook/zstd.git
)

cmake -G "Visual Studio 17 2022" -A x64 --install-prefix %~dp0stage -S zstd/build/cmake -B zstd_build -D CMAKE_BUILD_TYPE="Release" -D ZSTD_BUILD_STATIC=ON -D ZSTD_BUILD_SHARED=OFF -D ZSTD_BUILD_PROGRAMS=OFF -D ZSTD_BUILD_TESTS=OFF -D ZSTD_BUILD_CONTRIB=OFF
cmake --build zstd_build --target INSTALL --config Release
