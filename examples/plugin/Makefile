R2_LIBEXT=$(shell r2 -H R2_LIBEXT)
R2_USER_PLUGINS=$(shell r2 -H R2_USER_PLUGINS)
VFLAGS?=--enable-globals

all:
	-v $(VFLAGS) -shared plugin.v
	v -shared -o a.c plugin.v
	$(MAKE) install

install:
	cp -f plugin.$(R2_LIBEXT) $(R2_USER_PLUGINS)

uninstall:
	rm -f $(R2_USER_PLUGINS)/plugin.$(R2_LIBEXT)
