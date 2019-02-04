rm -Rf CMakeCache.txt CMakeFiles webrtc/{build,src,stamp,tmp}
cmake -DTARGET_OS="android" -DTARGET_CPU="arm64" -DWEBRTC_REVISION="ea143e774b4c00a74b617f272f5a8f71169cf24e" -DCMAKE_BUILD_TYPE=Debug # M65
# cmake -DTARGET_OS="linux" -DTARGET_CPU="arm64" -DWEBRTC_REVISION="ea143e774b4c00a74b617f272f5a8f71169cf24e " # M65
make -j4
pushd webrtc/src/out/Release
tar -czf lib.tar.gz obj
mv lib.tar.gz ../../../..
popd
