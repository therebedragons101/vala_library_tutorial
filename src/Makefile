##
# this makefile is based on work from https://github.com/antono/vala-object/blob/master/Makefile
# TODO resource bundling into executable
#
# for more complex build where there is more than one library see:
# https://github.com/therebedragons101/g_data_binding_lib/blob/master/src/Makefile
#
##
export LD_LIBRARY_PATH := $(shell pwd)
export GI_TYPELIB_PATH := $(shell pwd)

##
# READ THIS!
#
# edit LIBRARY_NAME and version (LIB_MAJOR, LIB_MINOR) here, note that 
# this will also change main file to be compiled in library to 
# ${LIBRARY_NAME}.vala. this is done to circumvent some problems in how 
# gir and typelib are generated. in default case file is required to be named
# src/library_demo_lib.vala
#
# also note that autotools and other more complex solutions will probably be 
# better once build is understood. this is just simplest start with simplest
# and clean as much as it is possible build system in order to ease the 
# understanding
##
COMMON_NAME := vala_library_tutorial
NAME_SUFFIX := _lib
LIBRARY_NAME := ${COMMON_NAME}${NAME_SUFFIX}
INCLUDES := ../includes/
BIN := ../bin/
RESOURCE := ../resources/

LIB_MAJOR := 0
LIB_MINOR := 1
LIB_VERSION := ${LIB_MAJOR}.${LIB_MINOR}

# add source files needed to be included with library here
SOURCES := ${LIBRARY_NAME}.vala \
           ${RESOURCE}lib.*

DEMO_SOURCES := demos/demo/main.vala \
                ${RESOURCE}demo.*

# define packages and possibile incude folders
PACKAGES := --pkg gio-2.0
DEMO_PACKAGES := --pkg gtk+-3.0

##
# TODO
# - .pc and .deps generation
# - rpm and deb package building
# - devassistant support
# - Flatpak support
##

############################################################################

##
# STATIC PART!
#
# When there is no additional needs this doesn't need to be edited unless
# tweaking is required
##
all: resources \
     ${LIBRARY_NAME}.so \
     demo \
     ${COMMON_NAME}${NAME_SUFFIX}-${LIB_VERSION}.typelib \
     move-binaries-to-bin

run: run-${COMMON_NAME}_lib

run-g_${COMMON_NAME}_lib:

# Vala

resources:
	sh ../scripts/build_resources.sh

${LIBRARY_NAME}.so:
	valac \
		-H ${INCLUDES}${LIBRARY_NAME}.h \
		--vapi=${INCLUDES}${LIBRARY_NAME}${LIB_MAJOR}.vapi \
		-X \
		-fPIC \
		-X \
		-shared \
		--library=${LIBRARY_NAME}${LIB_MAJOR} \
		--gir=${INCLUDES}${LIBRARY_NAME}-${LIB_VERSION}.gir \
		-o ${LIBRARY_NAME}${LIB_MAJOR}.so \
	${PACKAGES} \
	${SOURCES}

${LIBRARY_NAME}-${LIB_VERSION}.typelib:
	g-ir-compiler \
		--shared-library=${LIBRARY_NAME}${LIB_MAJOR}.so \
		--output=${INCLUDES}${LIBRARY_NAME}-${LIB_VERSION}.typelib \
		${INCLUDES}${LIBRARY_NAME}-${LIB_VERSION}.gir

demo:
	valac \
		${PACKAGES} \
		${DEMO_PACKAGES} \
		${DEMO_SOURCES} \
		${INCLUDES}${LIBRARY_NAME}${LIB_MAJOR}.vapi \
		-X -I${INCLUDES} \
		-X ${LIBRARY_NAME}${LIB_MAJOR}.so \
		-o ${BIN}demo

move-binaries-to-bin:
	mv *.so ${BIN}
# other

clean:
	rm -fr $(shell cat .gitignore)
