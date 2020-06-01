module vr2

import json
import r2

#define _const_vr2__radare_plugin radare_plugin

// implementation

struct R2ijcore {
	file string
	size int
	fd int
}

struct R2ij {
	core R2ijcore
}
pub struct RCore {}

fn plugin_call(coreptr voidptr, cmd byteptr) int {
	core := r2.cast(coreptr)
	c := string(cmd)
	// eprintln('calling v code to handle this command ($c)')
	if c.starts_with('v') {
		res := core.cmd('?e hello')
		eprintln('res = $res')
		eprintln('res = $res')
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

// definition

// #include "@VROOT/examples/plugin/plugin.v.c"
pub const (
	dummy_core_plugin = C.r_core_plugin_t {
		name: 'vr'.str
		desc: 'what'.str
		license: 'LGPL3'.str
		call: plugin_call
	}
	// TODO: _const_vr2__radare_plugin
	radare_plugin = C.r_lib_struct_t {
		@type: C.R_LIB_TYPE_CORE
		data: &dummy_core_plugin
	}
)
