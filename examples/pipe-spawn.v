module main

import radare.r2pipe

fn main() {
	mut r2p := r2pipe.spawn('/bin/ls', '')?
	hello_world := r2p.cmd('?E hello world')
	eprintln('message:')
	eprint('$hello_world')
	r2p.free()
}
