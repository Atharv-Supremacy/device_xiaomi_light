/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_dalvik_heap.h>
#include <libinit_variant.h>

#include "vendor_init.h"

static const variant_info_t light_info = {
    .hwc_value = "Global",
    .sku_value = "",
    .device = "light",
    .nfc = true,
};

static const variant_info_t thunder_info = {
    .hwname_value="thunder",
    .sku_value = "",
    .device = "thunder",
    .nfc = false,
};

static const std::vector<variant_info_t> variants = {
    light_info,
    thunder_info,
};

void vendor_load_properties() {
    search_variant(variants);
    set_dalvik_heap();
}
