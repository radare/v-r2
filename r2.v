module r2

#flag `pkg-config --cflags --libs r_core`

#include <r_core.h>

pub struct R2 {}

fn C.r_core_cmd_str(voidptr, string) byteptr
fn C.r_core_free(voidptr)
fn C.r_core_new() voidptr
fn C.r_cons_is_breaked() bool
fn C.r_cons_break_push(a, b voidptr) bool
fn C.r_cons_break_pop() bool

pub fn (core &R2)cmd(s string) string {
	C.r_cons_break_push(nil, nil)
	o := C.r_core_cmd_str (core, s.str)
	if isnil(o) {
		C.r_cons_break_pop()
		return ''
	}
	strs := tos_clone(o)
	unsafe {
		free(o)
	}
	C.r_cons_break_pop()
	return strs
}

pub fn (core &R2)str() string {
	return i64(core).str()
}

pub fn (core &R2)is_breaked() bool{
	return C.r_cons_is_breaked()
}

pub fn (core &R2)free() {
	C.r_core_free (core)
}

pub fn new() &R2 {
	return &R2(C.r_core_new ())
}
