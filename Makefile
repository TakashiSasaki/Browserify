.PHONY: prepare push pull clean all bundled
.SUFFIXES:
.SUFFIXES: .patched .ugly .js .beautiful .bundled  

vpath %.ugly tmp
vpath %.bundled bundled
vpath %.patch src
vpath %.js src

NODE=NODE_PATH=$(NODE_PATH):./bundled node

bundled: entryNo.bundled entryYes.bundled \
	standaloneNo.bundled standaloneYes.bundled \
 	requireNo.bundled requireYes.bundled \
 	targetNo.bundled targetYes.bundled

diff: 
	make -C bundled

clean:
	@rm -rf .*.swp *.bundled *.ugly \;
	make -C tmp clean ;\
	make -C bundled clean 

prepare:
	sudo n stable ;\
		sudo npm -g update ;\
		sudo npm -g install browserify js-beautify js-prettify @google/clasp myassert runinchrome

# ugly => beautiful => patched => bundled

%.beautiful : %.ugly
	js-beautify -f $< -o $@

%.patched : %.beautiful
	patch -o $@ $< src/$*.patch

%.bundled : %.patched
	js-beautify -f $< -o bundled/$@

tmp/entryYes.ugly: main.js hello.js goodbye.js 
	browserify --im -o $@ -e entryMain $^

tmp/entryNo.ugly: main.js hello.js goodbye.js 
	browserify --im -o $@ $^

tmp/standaloneNo.ugly: main.js hello.js goodbye.js 
	browserify --im -o $@ $^ 

tmp/standaloneYes.ugly: main.js hello.js goodbye.js 
	browserify --im -s hoge -o $@ $^

tmp/requireYes.ugly: main.js hello.js goodbye.js 
	browserify --im -o $@ $< -r ./src/hello.js -r ./src/goodbye.js

tmp/requireNo.ugly: main.js hello.js goodbye.js 
	browserify --im -o $@ $<

tmp/targetYes.ugly: main.js hello.js goodbye.js 
	browserify --im -o $@ $< -r ./src/hello.js:helloTarget -r ./src/goodbye.js:goodbyeTarget

tmp/targetNo.ugly: main.js hello.js goodbye.js 
	browserify --im -o $@ $< -r ./src/hello.js -r ./src/goodbye.js

