rem make sure you are in an x64 VC build environment first
git clone --depth=1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
set PATH=%PATH%;%CD%\depot_tools
fetch --nohooks --force webrtc
gclient sync
git clone https://github.com/modulesio/webrtc.git src
pushd src
rem M70
git checkout ca221eabcaed7580663e3727f092e278ac56bb68
set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set GYP_MSVS_VERSION=2017
gn gen out/Release "--args=is_debug=false is_official_build=true symbol_level=0 rtc_build_examples=false rtc_build_tools=false rtc_include_tests=false"
ninja -C out/Release
popd
