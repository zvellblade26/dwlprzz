#pragma once

#include <stdio.h>
#include <pixman.h>

pixman_image_t *jxl_load(FILE *fp, const char *path);
