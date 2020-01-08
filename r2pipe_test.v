import radare

fn test_main() {
	r2 := r2pipe.new()
	println(r2.cmd('x'))
	r2.free()
}

