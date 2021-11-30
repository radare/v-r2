import examples.radare.r2

fn main() {
	c := r2.new()
	c.cmd('o /bin/ls;s entry0')
	c.cmd('aaa 2> /dev/null')
	print(c.cmd('pd 10'))
	c.free()
}
