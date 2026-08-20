SUNDOWN_COMMIT := 37728fb2d7137ff7c37d0a474cb827a8d6d846d8

results.mk:
	[ -f sundown-$(SUNDOWN_COMMIT).tar.gz ] || { echo "missing vendored sundown-$(SUNDOWN_COMMIT).tar.gz; run 'toku vendor'" >&2; exit 1; }
	if [ -d sundown ]; then rm -rf sundown; fi
	mkdir sundown
	tar xf sundown-$(SUNDOWN_COMMIT).tar.gz -C sundown --strip-components=1
	cd sundown && $(CC) -c -Isrc -Ihtml src/*.c html/*.c
	echo "LIB_CFLAGS += -I$(CURDIR)/sundown/html -I$(CURDIR)/sundown/src" >> results.mk
	echo "LIB_LDFLAGS += $(CURDIR)/sundown/*.o" >> results.mk
