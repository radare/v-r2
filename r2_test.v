module r2

fn test_main() {
  c := new()
  print(c.cmd('?E Hello'))
  c.free()
}
