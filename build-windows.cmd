rem make sure you are in an x64 VC build environment first
git clone --depth=1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
set PATH=%PATH%;%CD%\depot_tools
fetch --nohooks --force webrtc
gclient sync
pushd src
rem M65
git checkout 9f7e2a9
set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set GYP_MSVS_VERSION=2017
gn gen out/Release "--args=is_debug=false is_official_build=true symbol_level=0 rtc_build_examples=false rtc_build_tools=false rtc_include_tests=false"
ninja -C out/Release
popd
