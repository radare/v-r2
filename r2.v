module r2

#pkgconfig r_core

#include <r_core.h>

pub struct RCore {}

fn C.r_core_cmd(core voidptr, cmd byteptr, log bool)
fn C.r_core_cmd_str(voidptr, string) byteptr
fn C.r_core_free(voidptr)
fn C.r_core_new() voidptr
fn C.r_cons_is_breaked() bool
fn C.r_cons_break_push(a voidptr, b voidptr) bool
fn C.r_cons_break_pop() bool

pub fn cast(p voidptr) &RCore {
	return &RCore(p)
}

pub fn (core &RCore)cmd(s string) string {
	C.r_cons_break_push(voidptr(0), voidptr(0))
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

pub fn (core &RCore)str() string {
	return i64(core).str()
}

pub fn (core &RCore)break_begin() {
	C.r_cons_break_push(voidptr(0), voidptr(0))
}

pub fn (core &RCore)break_end() bool {
	C.r_cons_break_pop()
	return C.r_cons_is_breaked()
}

pub fn (core &RCore)free() {
	C.r_core_free (core)
}

pub fn new() &RCore {
	return &RCore(C.r_core_new ())
}
