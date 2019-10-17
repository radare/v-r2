module r2

#flag `pkg-config --cflags --libs r_core`

#include <r_core.h>

struct R2 {}

pub fn (core &R2)cmd(s string) string {
	o := C.r_core_cmd_str (core, s.str)
	strs := string(byteptr(o))
	free(o)
	return strs
}

pub fn (core &R2)str() string {
	return i64(core).str()
}

pub fn (core &R2)free() {
	C.r_core_free (core)
}

pub fn new() &R2 {
	return &R2(C.r_core_new ())
}
