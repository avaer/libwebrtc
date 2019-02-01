rm -Rf CMakeCache.txt CMakeFiles webrtc/{build,src,stamp,tmp}
# cmake -DTARGET_OS="android" -DTARGET_CPU="arm64" -DWEBRTC_REVISION="4ccc1c4bb6fe8f1681380bb9557a7fe1847562cd" # M65
cmake -DTARGET_OS="linux" -DTARGET_CPU="arm64" -DWEBRTC_REVISION="4ccc1c4bb6fe8f1681380bb9557a7fe1847562cd" # M65
make -j4
pushd webrtc/src/out/Release
tar -czf lib.tar.gz obj
mv lib.tar.gz ../../../..
popd
