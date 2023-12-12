# radare2 bindings for V

[![CI](https://github.com/radare/v-r2/actions/workflows/ci.yml/badge.svg)](https://github.com/radare/v-r2/actions/workflows/ci.yml)

This repository contains the initial bindings of r2 for the V programming language.

## Installation

```go
$ v install radare.r2
$ v
>>> import radare.r2
>>> core := r2.new()
>>> print(core.cmd('?E Hello World'))
>>> core.free()
```

## Example

```go
module main

import radare.r2

fn main() {
  c := r2.new()
  print(c.cmd('?E Hello'))
  c.free()
}

```

or spawning:

```go
module main

import radare.r2

fn main() {
  mut c := r2.spawn('/bin/ls', '') or { panic(err) }
  print(c.cmd('?E Hello'))
  c.free()
}

```
