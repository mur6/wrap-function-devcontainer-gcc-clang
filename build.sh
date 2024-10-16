#!/bin/sh -x

BUILD_DIR=build

# build_without_wrap() {
#     rm -f *.o wrap nowrap

#     # build without wrapping
#     $CC -c wrap.c -o wrap.o
#     $CC -c wrap_b.c -o wrap_b.o
#     $CC wrap.o wrap_b.o -o nowrap
# }

# build_with_wrap() {
#     rm -f *.o wrap

#     # build with wrapping
#     $CC -DWRAP -c wrap.c -o wrap.o
#     $CC -DWRAP -c wrap_b.c -o wrap_b.o
#     $CC -Wl,--wrap=moveme wrap.o wrap_b.o -o wrap
# }

show_compiler_version() {
    echo "==== gcc version"
    gcc --version
    echo "==== clang version"
    clang --version
    echo "==== ld version"
    ld --version
    echo
    echo
}

cleanup() {
    rm -rf $BUILD_DIR
}

build_by_gcc () {
    mkdir -p $BUILD_DIR
    gcc src/main.c src/foo.c -Wl,--wrap=foo -o $BUILD_DIR/main_gcc
}

build_by_clang () {
    mkdir -p $BUILD_DIR
    clang src/main.c src/foo.c -Wl,--wrap=foo -o $BUILD_DIR/main_clang
}

run() {
    echo "==== Run main_gcc"
    $BUILD_DIR/main_gcc
    echo "==== Run main_clang"
    $BUILD_DIR/main_clang
}

cleanup
show_compiler_version
build_by_gcc
build_by_clang
run
