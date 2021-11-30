module r2

#pkgconfig --cflags --libs r_core
#include <r_core.h>
#include <r_lib.h>

type CorePluginInitCallback = fn (voidptr, byteptr) int

type CorePluginCallCallback = fn (voidptr, byteptr) int

pub struct C.r_lib_struct_t {
	@type   int
	data    voidptr
	version byteptr
	// free voidptr
	pkgname byteptr
}

pub struct C.r_core_plugin_t {
	name    byteptr
	desc    byteptr
	license byteptr
	init    CorePluginInitCallback
	call    CorePluginCallCallback
}

/*
// example
const (
	dummy_core_plugin = C.r_core_plugin_t {
		name: 'vr'.str
		desc: 'what'.str
		license: 'LGPL3'.str
		call: plugin_call
	}
	radare_plugin = C.r_lib_struct_t {
		@type: C.R_LIB_TYPE_CORE
		data: &dummy_core_plugin
	}
)
*/
