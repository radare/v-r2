import radare.r2

fn test_main() {
  c := r2.new()
  print(c.cmd('?E Hello'))
  c.free()
}
