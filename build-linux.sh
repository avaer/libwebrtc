git clone --depth=1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$PATH:$(pwd)/depot_tools
fetch --nohooks --force webrtc
gclient sync
git clone https://github.com/modulesio/webrtc.git src
pushd src
# M70
git checkout ca221eabcaed7580663e3727f092e278ac56bb68
gn gen out/Release "--args=is_debug=false is_official_build=true symbol_level=0 rtc_build_examples=false rtc_build_tools=false rtc_include_tests=false use_lld=false use_gold=true use_thin_lto=false is_cfi=false target_cpu=\"x64\""
ninja -C out/Release
popd
