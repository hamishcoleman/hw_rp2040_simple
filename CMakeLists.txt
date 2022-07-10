cmake_minimum_required(VERSION 3.12)

set(PICO_SDK_PATH ../pico-sdk)

# Pull in SDK (must be before project)
include(pico-sdk/external/pico_sdk_import.cmake)

project(pico_simple C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Initialize the SDK
pico_sdk_init()


#set(CMAKE_BUILD_TYPE "Release")



add_compile_options(-Wall
    -Wno-format          # int != int32_t as far as the compiler is concerned because gcc has int32_t as long int
    )

add_executable(hello_usb hello_usb.c)

# pull in common dependencies
target_link_libraries(hello_usb pico_stdlib)

# enable usb output, disable uart output
pico_enable_stdio_usb(hello_usb 1)
pico_enable_stdio_uart(hello_usb 0)

pico_add_extra_outputs(hello_usb)
