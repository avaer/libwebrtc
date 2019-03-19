git clone --depth=1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$PATH:$(pwd)/depot_tools
fetch --nohooks --force webrtc
gclient sync
git clone https://github.com/modulesio/webrtc.git src
pushd src
# M71
git checkout 77de4050abfbbfaaa036cc7526c078bb2c94308c
gn gen out/Release_x64 "--args=is_debug=false symbol_level=0 rtc_build_examples=false rtc_build_tools=false rtc_include_tests=false use_lld=false use_gold=true use_thin_lto=false is_cfi=false use_custom_libcxx=false use_custom_libcxx_for_host=false target_cpu=\"x64\""
ninja -C out/Release_x64
popd
