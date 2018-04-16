.PHONY: prepare push pull clean all 
.SUFFIXES: .patched .ugly .js .beautiful .bundled .nodejs
.INTERMEDIATE: entryYes.tmp entryNo.tmp

NODE=NODE_PATH=$(NODE_PATH):. node

all: entry standalone require target

push: $(BROWSERIFIED)
	clasp push

pull:
	clasp pull

clean:
	@rm -rf *.ugly *.beautiful *.patched *.rej *.bundled

prepare:
	sudo n stable ;\
		sudo npm -g update ;\
		sudo npm -g install browserify js-beautify js-prettify @google/clasp

# ugly => beautiful => patched => bundled

.ugly.beautiful:
	js-beautify -f $< -o $@

.beautiful.patched:
	patch -o $@ $< $*.patch

.patched.bundled:
	js-beautify -f $< -o $@

include entry.mk
include standalone.mk
include require.mk
include target.mk

