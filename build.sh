#!/bin/sh -x

CC=gcc
BUILD_DIR=build

build_without_wrap() {
    rm -f *.o wrap nowrap

    # build without wrapping
    $CC -c wrap.c -o wrap.o
    $CC -c wrap_b.c -o wrap_b.o
    $CC wrap.o wrap_b.o -o nowrap
}

build_with_wrap() {
    rm -f *.o wrap

    # build with wrapping
    $CC -DWRAP -c wrap.c -o wrap.o
    $CC -DWRAP -c wrap_b.c -o wrap_b.o
    $CC -Wl,--wrap=moveme wrap.o wrap_b.o -o wrap
}

cleanup() {
    rm -f *.o wrap nowrap
}

cleanup
# build_without_wrap
# build_with_wrap


build_by_gcc () {
    gcc main.c foo.c -Wl,--wrap=foo -o $BUILD_DIR/main_gcc
}

build_by_clang () {
    clang main.c foo.c -Wl,--wrap=foo -o $BUILD_DIR/main_clang
}
