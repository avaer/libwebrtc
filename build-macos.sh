git clone --depth=1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$PATH:$(pwd)/depot_tools
fetch --nohooks --force webrtc
gclient sync
pushd src
# M71
git checkout ce65c12e9b40596bd977c14cfb2fc6c82a10acaf
gn gen out/Release_x64 "--args=is_debug=false symbol_level=0 rtc_build_examples=false rtc_build_tools=false rtc_include_tests=false"
ninja -C out/Release_x64
popd
