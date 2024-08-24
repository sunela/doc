#!/bin/sh
#
# Makefile - Structure screenshots in gallery, walk-through
#
# This work is licensed under the terms of the MIT License.
# A copy of the license can be found in the file LICENSE.MIT
#

.PHONY:		all pages clean

all:		pages.pdf gallery.pdf

gallery.fig:	mkgallery
		./mkgallery >$@ || { rm -f $@; exit 1; }

%.pdf:		%.fig
		fig2dev -L pdf $< $@

#
# Note: the "pages" target is somewhat dangerous. It generates and stores the
# page images, but does not ensure they match what it expected.
# @@@ We still need to store some reference information, be it a cache of
# manually checked images, or at least a list of hashes of such images.
#

pages:
		../fw/tests/pages.sh store

clean:
