HEADERS = ffi.framework/Headers
CC = xcrun -sdk iphoneos clang -miphoneos-version-min=6.0 -fembed-bitcode
CC_SIM = xcrun -sdk iphonesimulator clang -miphoneos-version-min=6.0
all:
	mkdir -p $(HEADERS)
	CC='$(CC) -arch armv7' ./configure --host armv7-apple-darwin
	cd armv7-apple-darwin && make
	cp armv7-apple-darwin/include/ffi.h $(HEADERS)/ffi_armv7.h
	cp armv7-apple-darwin/include/ffitarget.h $(HEADERS)/ffitarget_armv7.h
	echo
	CC='$(CC) -arch armv7s' ./configure --host armv7s-apple-darwin
	cd armv7s-apple-darwin && make
	echo
	CC='$(CC_SIM) -arch i386' ./configure --host i386-apple-darwin
	cd i386-apple-darwin && make
	cp i386-apple-darwin/include/ffi.h $(HEADERS)/ffi_i386.h
	cp i386-apple-darwin/include/ffitarget.h $(HEADERS)/ffitarget_i386.h
	echo
	CC='$(CC_SIM) -arch x86_64' ./configure --host x86_64-apple-darwin
	cd x86_64-apple-darwin && make
	cp x86_64-apple-darwin/include/ffi.h $(HEADERS)/ffi_x86_64.h
	cp x86_64-apple-darwin/include/ffitarget.h $(HEADERS)/ffitarget_x86_64.h
	echo
	CC='$(CC) -arch arm64' ./configure --host aarch64-apple-darwin
	cd aarch64-apple-darwin && make
	cp aarch64-apple-darwin/include/ffi.h $(HEADERS)/ffi_arm64.h
	cp aarch64-apple-darwin/include/ffitarget.h $(HEADERS)/ffitarget_arm64.h
	echo
	lipo -create -output ffi.framework/ffi *-apple-darwin/.libs/libffi.a

clean:
	rm -rf *-apple-darwin

