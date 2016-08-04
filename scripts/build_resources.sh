#!/bin/bash
DIR=`pwd`
for fl in `find ./ -type f -iname "*.resource"`; do
	RDIR=`dirname $fl`
	cd "$RDIR"
	glib-compile-resources `basename $fl` --generate-source
	glib-compile-resources `basename $fl` --generate-header
	cd "$DIR"
	DES=`basename $fl`
	FL=${fl//".resource"/""}
	DES=${DES//".resource"/""}
	
	mv $FL.resource.c ../resources/$DES.c
	mv $FL.resource.h ../resources/$DES.h
done
cd "$DIR"
