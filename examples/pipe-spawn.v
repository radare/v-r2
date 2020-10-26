module main

import radare.r2pipe

fn main() {
	mut r2p := r2pipe.spawn('/bin/ls', '') or {
		eprintln('Cannot spawn')
		exit(1)
	}
	hello_world := r2p.cmd('?e hello world')
	eprintln('message: $hello_world')
	r2p.free()
}
