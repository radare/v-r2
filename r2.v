module r2

#flag `pkg-config --cflags --libs r_core`

#include <r_core.h>

pub struct R2 {}

fn C.r_core_cmd_str(voidptr, string) byteptr
fn C.r_core_free(voidptr)
fn C.r_core_new() voidptr

pub fn (core &R2)cmd(s string) string {
	o := C.r_core_cmd_str (core, s.str)
	if isnil(o) {
		return ''
	}
	strs := tos_clone(string(o))
	unsafe {
		free(o)
	}
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
