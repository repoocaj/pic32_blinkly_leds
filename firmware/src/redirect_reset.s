
#include "xc.h"
#include <cp0defs.h>
       .set nomips16


        .section .redirect_reset,code,keep
        .align 2
        .set noreorder
        .ent _redirect_reset

	_redirect_reset:
        jal _reset
	nop

                .align 2
        .end _redirect_reset
        .globl _redirect_reset
        .size _redirect_reset, .-_redirect_reset

	