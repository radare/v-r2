module vr2

import json

struct R2ijcore {
	file string
	size int
	fd int
}

struct R2ij {
	core R2ijcore
}

fn plugin_call(core voidptr, cmd byteptr) int {
	c := string(cmd)
	// eprintln('calling v code to handle this command ($c)')
	if c.starts_with('v') {
		// eprintln('Intercepted!')
		C.r_core_cmd (core, '?E CLIPPY', 0)
		ij := string(C.r_core_cmd_str (core, 'ij'))
		a := json.decode(R2ij, ij) or {
			eprintln ('failed to decode ij JSON')
			return 0
		}
		eprintln(a.core.file)
		return 1
	}
	return 0
}


////////////////////////////////////////////////////////////////

#include <r_core.h>
#include <r_lib.h>
#flag `pkg-config --cflags --libs r_core`
fn C.r_core_cmd(core voidptr, cmd byteptr, log bool)
fn C.r_core_cmd_str(core voidptr, cmd byteptr) byteptr

// actually using the C bridge
#include "@VROOT/examples/plugin/plugin.v.c"

type CorePluginInitCallback fn(voidptr,byteptr) int
type CorePluginCallCallback fn(voidptr,byteptr) int

struct C.r_lib_struct_t {
	@type int
	data voidptr
	version byteptr
	// free voidptr
	pkgname byteptr
}

struct C.r_core_plugin_t {
	name byteptr
	desc byteptr
	license byteptr
	init CorePluginInitCallback
	call CorePluginCallCallback
}

// XXX const and __global and $if seems to be broken

dummy_core_plugin := C.r_core_plugin_t {
	name: 'vr'.str
	desc: 'what'.str
	license: 'LGPL3'.str
	call: plugin_call
}
dummy_radare_plugin := C.r_lib_struct_t {
	@type: C.R_LIB_TYPE_CORE
	data: &dummy_core_plugin
}
