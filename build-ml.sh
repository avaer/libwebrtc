rm -Rf CMakeCache.txt CMakeFiles webrtc/{build,src,stamp,tmp}
cmake -DTARGET_OS="android" -DTARGET_CPU="arm64" -DWEBRTC_REVISION="ca221eabcaed7580663e3727f092e278ac56bb68" . # M70
# cmake -DTARGET_OS="android" -DTARGET_CPU="arm64" -DWEBRTC_REVISION="ca221eabcaed7580663e3727f092e278ac56bb68" -DCMAKE_BUILD_TYPE=Debug # M70
# cmake -DTARGET_OS="linux" -DTARGET_CPU="arm64" -DWEBRTC_REVISION="ca221eabcaed7580663e3727f092e278ac56bb68" # M70
make -j4
pushd webrtc/src/out/Release
tar -czf lib.tar.gz obj
mv lib.tar.gz ../../../..
popd

# /home/ubuntu/android-ndk-r19/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android-ar t libwebrtc.a >extract.sh; gawk -i inplace '{print "echo " $s " && ar x libwebrtc.a " $s " && ar d libwebrtc.a " $s " && mv " $s " " NR "-" $s}' extract.sh; chmod +x extract.sh; ./extract.sh; rm libwebrtc.a; /home/ubuntu/android-ndk-r19/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android-ar crs libwebrtc.a *.o; /home/ubuntu/android-ndk-r19/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android-objcopy libwebrtc.a; /home/ubuntu/android-ndk-r19/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android-objcopy --redefine-sym isqrt32=webrtc_isqrt32 --redefine-sym silk_insertion_sort_increasing=webrtc_silk_insertion_sort_increasing --redefine-sym silk_insertion_sort_increasing_all_values_int16=webrtc_silk_insertion_sort_increasing_all_values_int16 libwebrtc.a; /home/ubuntu/android-ndk-r19/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android-objcopy --prefix-symbols=webrtc_ libwebrtc.a; /home/ubuntu/android-ndk-r19/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android-objcopy --redefine-syms=symbols.txt libwebrtc.a;
