# Copyright 2009 The Go Authors.  All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

include $(GOROOT)/src/Make.$(GOARCH)

all: install test-sdl

install:
	make -C sdl install
	make -C ttf install
	make -C mixer install

test-sdl: test-sdl.go install
	$(GC) test-sdl.go
	$(LD) -o $@ test-sdl.$(O)

clean:
	make -C sdl clean
	make -C ttf clean
	make -C mixer clean
	make -C 4s clean
	rm -f -r *.8 *.6 *.o */*.8 */*.6 */*.o */_obj test-sdl
