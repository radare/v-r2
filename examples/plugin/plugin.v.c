#if 0
#include <r_core.h>
#include <r_lib.h>

static int vr2__plugin_call(voidptr user, byteptr input);
/*
static int vr2__plugin_init(void *user, const char *input) {
	_vinit();
}
*/

RCorePlugin vr2_plugin = {
        .name = "vr2",
        .desc = "The reworked analysis from scratch thing",
        .license = "LGPL3",
//        .init = vr2__plugin_init,
        .call = vr2__plugin_call,
};

struct r_lib_struct_t _const_vr2__radare_plugin; // inited later
#define cp _const_vr2__radare_plugin

// extern struct r_lib_struct_t _const_vr2__radare_plugin; // inited later

RLibStruct radare_plugin = {
	.type = R_LIB_TYPE_CORE,
	.data = &vr2_plugin, // &cp,
	.pkgname = "vr2",
        .version = R2_VERSION
};

#endif
