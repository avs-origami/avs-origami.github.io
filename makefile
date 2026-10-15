SHELL := /bin/bash

# Pages: site/foo/bar.md -> docs/foo/bar.html
MD     := $(shell find site -type f -name '*.md')
PAGES  := $(patsubst site/%.md,docs/%.html,$(MD))

# Top-level css/js/xml -> docs/
TOP    := $(wildcard *.css *.js *.xml)
TOPOUT := $(addprefix docs/,$(TOP))

# Asset directories copied as-is
IMG    := $(shell find img uploads -type f)
IMGOUT := $(addprefix docs/,$(IMG))

# misc/* is flattened into docs/
MISC    := $(shell find misc -type f)
MISCOUT := $(patsubst misc/%,docs/%,$(MISC))

all: $(PAGES) $(TOPOUT) $(IMGOUT) $(MISCOUT) docs/favicon.png

# Rebuild a page if its source, the template, or the parser changes
$(PAGES): docs/%.html: site/%.md template.html parse build makefile
	@mkdir -p $(@D)
	bash ./build $< $@

$(TOPOUT): docs/%: %
	@mkdir -p $(@D)
	cp $< $@

$(IMGOUT): docs/%: %
	@mkdir -p $(@D)
	cp $< $@

$(MISCOUT): docs/%: misc/%
	@mkdir -p $(@D)
	cp $< $@

docs/favicon.png: site/favicon.png
	@mkdir -p $(@D)
	cp $< $@

clean:
	rm -rf docs

force:
	$(MAKE) -B all

.PHONY: all clean force