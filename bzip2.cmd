if not exist bzip2 (
    git clone --depth=1 --branch 1ea1ac188ad4b9cb662e3f8314673c63df95a589 https://gitlab.com/bzip2/bzip2.git
)

cmake -G "Visual Studio 17 2022" -A x64 --install-prefix %~dp0stage -S bzip2 -B bzip2_build -D CMAKE_BUILD_TYPE="Release" -D ENABLE_LIB_ONLY=ON -D ENABLE_SHARED_LIB=OFF -D ENABLE_STATIC_LIB=ON
cmake --build bzip2_build --target INSTALL --config Release
