module vr2

import json

#include "@VROOT/examples/plugin/plugin.v.c"
#flag `pkg-config --cflags --libs r_core`

struct R2ijcore {
	file string
	size int
	fd int
}

struct R2ij {
	core R2ijcore
}

fn C.r_core_cmd(core voidptr, cmd byteptr, log bool)
fn C.r_core_cmd_str(core voidptr, cmd byteptr) byteptr

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

/*
type C.RLibStruct = struct {}
	rtype int
	data voidptr
	version &string
	free voidptr
	pkgname &string
}

// C.radare_plugin

fn main() {
	eprintln('$C.radare_plugin')
}

const (
	v = '123'
	p = 'vr2'
)


struct C.RLibStruct {
	rtype int
	data voidptr
	version byteptr
	free voidptr
	pkgname byteptr
}


__global foo := 'bar'.str
radare_plugin := &C.RLibStruct {
	version: 'foo'.str
	pkgname: 'bar'.str
}
*/
