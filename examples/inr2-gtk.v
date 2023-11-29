module main

// import r2.pipe
import zenith391.vgtk3.gtk

fn on_destroy(window gtk.Window, data voidptr) {
	gtk.main_quit()
}

fn on_click(window gtk.Window, data voidptr) {
	gtk.main_quit()
}

pub fn entry(core &R2) {
	hello_world := core.cmd('?e hello world')
	eprintln('hello_world $hello_world')

	// gui
	w := gtk.new_window()
	w.set_title('hello from r2-gtk')
	w.set_default_size(400, 320)

	vbox := gtk.new_vbox(10)
	label := gtk.new_label('Hello VGtk World')
	vbox.pack_start(label, true, true, 0)

	on_click := fn (w gtk.Button, d voidptr) {
		r2 := &R2(d)
		_ := r2.cmd('aaa')
	}
	button := gtk.new_button_with_label('Analyze!')
	button.on('clicked', on_click, core)
	vbox.pack_start(button, true, true, 0)
	w.add(vbox)
	w.on('destroy', on_destroy, w)

	w.show_all()
	gtk.main()
}
