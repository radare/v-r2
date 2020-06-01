module main

import r2.pipe

fn main() {
	r2p := pipe.open('r2 -q0 /bin/ls')
	if r2p == 0 {
		eprintln('Cannot spawn')
		exit(1)
	}
	hello_world := r2p.cmd('?e hello world')
	eprintln('hello_world $hello_world')
	r2p.close()
}
