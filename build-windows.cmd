rem make sure you are in an x64 VC build environment first
git clone --depth=1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
set PATH=%PATH%;%CD%\depot_tools
set DEPOT_TOOLS_WIN_TOOLCHAIN=0
fetch --nohooks --force webrtc
gclient sync
git clone https://github.com/modulesio/webrtc.git src
pushd src
rem M71
rem git checkout 0ba24191ee90c70679d2452363676c2d65b6b751
git checkout 01e5d791911a1a74cb8d6d071277c9d34a977896
set GYP_MSVS_VERSION=2017
gn gen out/Release_x64 "--args=is_debug=false is_official_build=true symbol_level=0 rtc_build_examples=false rtc_build_tools=false rtc_include_tests=false use_lld=false"
ninja -C out/Release_x64
popd
