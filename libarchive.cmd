set TEMP=%~dp0
echo %TEMP%
SET "ROOT=%TEMP:\=/%"
echo %ROOT%

set VERSION=v3.8.5

if not exist libarchive (
    git clone --depth=1 -b %VERSION% --single-branch https://github.com/libarchive/libarchive.git build\libarchive
) else (
    cd build\libarchive
    git fetch --all --unshallow
    git checkout -b temp %VERSION%
    git reset --hard %VERSION%
    git clean -fdx
    cd %ROOT%
)

if exist build\libarchive (
    cmake -A x64 --install-prefix "%ROOT%stage" -S build/libarchive -B build/libarchive_build -D CMAKE_BUILD_TYPE="Release" -D ZLIB_LIBRARY="%ROOT%stage/lib/zs.lib" -D ZLIB_INCLUDE_DIR=stage/include -D BZIP2_LIBRARIES="%ROOT%stage/lib/bz2_static.lib" -D BZIP2_INCLUDE_DIR=stage/include -D LZMA_API_STATIC=ON -D LIBLZMA_LIBRARY="%ROOT%stage/lib/lzma.lib" -D LIBLZMA_INCLUDE_DIR=stage/include -D ZSTD_LIBRARY="%ROOT%stage/lib/zstd_static.lib" -D ZSTD_INCLUDE_DIR=stage/include -D ENABLE_OPENSSL=OFF
    cmake --build build/libarchive_build --target ALL_BUILD --config Release
    cmake --build build/libarchive_build --target INSTALL --config Release
)
