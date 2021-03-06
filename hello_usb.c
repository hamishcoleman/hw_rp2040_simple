/**
 * Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <stdio.h>
#include "pico/stdlib.h"

int main() {
    stdio_init_all();
    while (true) {
        printf("Hello, world! Compiled at: %s %s\n",
                __DATE__,
                __TIME__);
        sleep_ms(1000);
    }
    return 0;
}
