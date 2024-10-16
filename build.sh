#!/bin/sh -x

CC=gcc

function build_without_wrap() {
    rm -f *.o wrap nowrap

    # build without wrapping
    $CC -c wrap.c -o wrap.o
    $CC -c wrap_b.c -o wrap_b.o
    $CC wrap.o wrap_b.o -o nowrap
}

function build_with_wrap() {
    rm -f *.o wrap

    # build with wrapping
    $CC -DWRAP -c wrap.c -o wrap.o
    $CC -DWRAP -c wrap_b.c -o wrap_b.o
    $CC -Wl,--wrap=moveme wrap.o wrap_b.o -o wrap
}

function cleanup() {
    rm -f *.o wrap nowrap
}

cleanup
# build_without_wrap
build_with_wrap
