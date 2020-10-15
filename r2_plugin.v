module r2

#include <r_core.h>
#include <r_lib.h>
// #flag `pkg-config --cflags --libs r_core`
#flag -I/usr/local/include/libr -I/usr/local/include/libr/sdb -L/usr/local/lib -lr_core -lr_config -lr_debug -lr_bin -lr_anal -lr_bp -lr_egg -lr_asm -lr_lang -lr_parse -lr_flag -lr_reg -lr_search -lr_syscall -lr_fs -lr_io -lr_socket -lr_cons -lr_magic -lr_crypto -lr_hash -lr_util -ldl
#flag -I/usr/include/libr -I/usr/include/libr/sdb -L/usr/lib -lr_core -lr_config -lr_debug -lr_bin -lr_anal -lr_bp -lr_egg -lr_asm -lr_lang -lr_parse -lr_flag -lr_reg -lr_search -lr_syscall -lr_fs -lr_io -lr_socket -lr_cons -lr_magic -lr_crypto -lr_hash -lr_util -ldl

type CorePluginInitCallback = fn(voidptr,byteptr) int
type CorePluginCallCallback = fn(voidptr,byteptr) int

pub struct C.r_lib_struct_t {
	@type int
	data voidptr
	version byteptr
	// free voidptr
	pkgname byteptr
}

pub struct C.r_core_plugin_t {
	name byteptr
	desc byteptr
	license byteptr
	init CorePluginInitCallback
	call CorePluginCallCallback
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
