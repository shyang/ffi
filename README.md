### Precompiled libffi for iOS

1. [get the libffi source](https://github.com/libffi/libffi/tree/b841ae70a05a5e11de1fca1b4551189db0895cf2)

2. build

	```
	$ make -f build-libffi-3.2.1.mk
	
	$ file ffi.framework/ffi
	ffi.framework/ffi: Mach-O universal binary with 5 architectures: [arm_v7: current ar archive random library] [arm_v7s: current ar archive random library] [i386: current ar archive random library] [x86_64: current ar archive random library] [arm64: current ar archive random library]
	ffi.framework/ffi (for architecture armv7):	current ar archive random library
	ffi.framework/ffi (for architecture armv7s):	current ar archive random library
	ffi.framework/ffi (for architecture i386):	current ar archive random library
	ffi.framework/ffi (for architecture x86_64):	current ar archive random library
	ffi.framework/ffi (for architecture arm64):	current ar archive random library
	```

3. create an umbrella header: ffi.framework/Headers/ffi.h
4. Use

```
#import <ffi/ffi.h>
```