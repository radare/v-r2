module r2pipe

import os

// extern
pub fn C.write(fd int, buf byteptr, len int) int
pub fn C.read(fd int, buf byteptr, len int) int

pub struct R2Pipe {
mut:
	inp int
	out int
}

pub fn new() R2Pipe {
	inp := os.getenv('R2PIPE_IN')
	out := os.getenv('R2PIPE_OUT')
	if inp == '' || out == '' {
		return &R2Pipe{}
	}
	mut r2 := R2Pipe{}
	r2.inp = inp.int()
	r2.out = out.int()
	return r2
}

pub fn (r2 &R2Pipe)cmd(command string) string {
	C.write(r2.out, '${command}\n', command.len + 1)
	mut buf := [1024]int
	for true {
		C.read(r2.inp, buf, 1)
		println('FIRST CHAR ${buf[0]}')
	}
	return 'jiji'
}

pub fn (r2 &R2Pipe)free() {
	C.close(r2.inp)
	C.close(r2.out)
	free(r2)
}
