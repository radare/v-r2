#include <r_core.h>
#include <r_lib.h>

static int vr2__plugin_call(voidptr user, byteptr input);
static int vr2__plugin_init(void *user, const char *input) {
	_vinit();
}

RCorePlugin vr2_plugin = {
        .name = "vr2",
        .desc = "The reworked analysis from scratch thing",
        .license = "LGPL3",
        .init = vr2__plugin_init,
        .call = vr2__plugin_call,
};

RLibStruct radare_plugin = {
	.type = R_LIB_TYPE_CORE,
	.data = &vr2_plugin,
	.pkgname = "vr2",
        .version = R2_VERSION
};

