if not exist libarchive (
    git clone --depth=1 https://github.com/libarchive/libarchive.git
)

cmake -G "Visual Studio 17 2022" -A x64 --install-prefix %~dp0stage -S libarchive -B libarchive_build -D CMAKE_BUILD_TYPE="Release" -D ZLIB_LIBRARY="%~dp0stage\lib\zlibstatic" -D ZLIB_INCLUDE_DIR=stage/include -D BZIP2_LIBRARIES=stage/lib/bz2_static.lib -D BZIP2_INCLUDE_DIR=stage/include -D LIBLZMA_LIBRARY=stage/lib/lzma.lib -D LIBLZMA_INCLUDE_DIR=stage/include -D ZSTD_LIBRARY=stage/lib/zstd_static.lib -D ZSTD_INCLUDE_DIR=stage/include
cmake --build libarchive_build --target ALL_BUILD --config Release
cmake --build libarchive_build --target INSTALL --config Release
