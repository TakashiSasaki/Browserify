.PHONY: prepare clean all bundled diff node
.SUFFIXES: .patched .ugly .js .beautiful .bundled  

vpath %.ugly tmp
vpath %.bundled bundled
vpath %.patch src
vpath %.js src

all: 
	make bundled ;\
	make -C bundled ;\
		make -C chrome ;\
		make -C node ;

bundled: entryNo.bundled entryYes.bundled entryDummy.bundled \
	externalNo.bundled externalYes.bundled externalDummy.bundled \
	standaloneNo.bundled standaloneYes.bundled \
 	requireNo.bundled requireYes.bundled requireDummy.bundled requireHello.bundled requireTarget.bundled \
 	targetNo.bundled targetYes.bundled

diff: bundled
	make -C bundled

node: bundled
	make -C node

clean:
	@rm -rf .*.swp *.bundled *.ugly \;
	make -C tmp clean ;\
	make -C bundled clean  ;\
	make -C chrome clean; \
	make -C node clean

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

IGNORE_MISSING=--im

tmp/entryNo.ugly: main.js hello.js goodbye.js 
	browserify $(IGNORE_MISSING) -o $@ $<

tmp/entryYes.ugly: main.js hello.js goodbye.js entry.js
	browserify $(IGNORE_MISSING) -o $@ -e src/entry.js $<

tmp/entryDummy.ugly: main.js hello.js goodbye.js
	browserify $(IGNORE_MISSING) -o $@ -e dummy $<

tmp/externalNo.ugly: main.js hello.js goodbye.js 
	browserify $(IGNORE_MISSING) -o $@ $<

tmp/externalYes.ugly: main.js hello.js goodbye.js external.js
	browserify $(IGNORE_MISSING) -o $@ -x ./external.js $<

tmp/externalDummy.ugly: main.js hello.js goodbye.js
	browserify $(IGNORE_MISSING) -o $@ -x dummy $<

tmp/standaloneNo.ugly: main.js hello.js goodbye.js 
	browserify $(IGNORE_MISSING) -o $@ $< 

tmp/standaloneYes.ugly: main.js hello.js goodbye.js 
	browserify $(IGNORE_MISSING) -s hoge -o $@ $<

tmp/requireNo.ugly: main.js hello.js goodbye.js 
	browserify $(IGNORE_MISSING) -o $@ $<

tmp/requireYes.ugly: main.js hello.js goodbye.js 
	browserify $(IGNORE_MISSING) -o $@ -r $<

tmp/requireDummy.ugly: main.js hello.js goodbye.js
	browserify $(IGNORE_MISSING) -o $@ $< -r dummy

tmp/requireHello.ugly: main.js hello.js goodbye.js
	browserify $(IGNORE_MISSING) -o $@ $< -r ./src/hello.js

tmp/requireTarget.ugly: main.js hello.js goodbye.js
	browserify $(IGNORE_MISSING) -o $@ $< -r ./src/hello.js:helloTarget

tmp/targetYes.ugly: main.js hello.js goodbye.js 
	browserify $(IGNORE_MISSING) -o $@ $< -r ./src/hello.js:helloTarget -r ./src/goodbye.js:goodbyeTarget

tmp/targetNo.ugly: main.js hello.js goodbye.js 
	browserify $(IGNORE_MISSING) -o $@ $< -r ./src/hello.js -r ./src/goodbye.js

