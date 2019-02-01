git clone --depth=1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$PATH:$(pwd)/depot_tools
fetch --nohooks --force webrtc
gclient sync
pushd src
git checkout 9f7e2a9 # M65
gn gen out/Release "--args=is_debug=false is_official_build=true symbol_level=0 rtc_build_examples=false rtc_build_tools=false rtc_include_tests=false"
ninja -C out/Release
popd
