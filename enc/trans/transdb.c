/**********************************************************************

  enc/trans/transdb.c -

  Copyright (C) 2008 Yukihiro Matsumoto

**********************************************************************/

#include "ruby.h"

void rb_declare_transcoder(const char *enc1, const char *enc2, const char *lib);

void
Init_transdb(void)
{
#include "transdb.h"
}
