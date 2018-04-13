.PHONY: test prepare browserified push pull clean all test-entry diff-entry
NODE=NODE_PATH=$(NODE_PATH):. node

all: test-standalone test-require test-entry

push: $(BROWSERIFIED)
	clasp push

pull:
	clasp pull

clean:
	@rm -rf entryYes.js entryNo.js standaloneYes.js standaloneNo.js requireYes.js requireNo.js tmp.js *.tmp

prepare:
	sudo n stable ;\
		sudo npm -g update ;\
		sudo npm -g install browserify js-beautify js-prettify @google/clasp

%.js: %.tmp
	@js-beautify -f $< -o $@

entryYes.tmp: hello.js goodbye.js entryMain.js
	browserify -e entryMain -o $@ $^

entryNo.tmp : hello.js goodbye.js entryMain.js
	browserify -o $@ $^ 

test-entryYes: entryYes.js
	$(NODE) $<

test-entryNo: entryNo.js
	$(NODE) $<

test-entry: test-entryYes test-entryNo

diff-entry: entryNo.js entryYes.js
	diff -w $^

requireYes.tmp: hello.js goodbye.js requireMain.js
	browserify -r ./hello.js -r ./goodbye.js -o $@ requireMain.js 

requireNo.tmp: hello.js goodbye.js requireMain.js
	browserify -o $@ requireMain.js 

test-requireYes: requireYes.js
	$(NODE) $<

test-requireNo: requireNo.js
	$(NODE) $<

test-require: test-requireYes test-requireNo

diff-require: requireYes.js requireNo.js
	diff -w $^

standaloneNo.tmp: hello.js goodbye.js standaloneMain.js
	browserify -o $@ $^ 

standaloneYes.tmp: hello.js goodbye.js standaloneMain.js
	browserify -s standaloneYes -o $@ $^ 

test-standaloneNo: standaloneNo.js
	$(NODE) $<

test-standaloneYes: standaloneYes.js
	$(NODE) $<

test-standalone: test-standaloneYes test-standaloneNo

diff-standalone: standaloneYes.js standaloneNo.js
	diff -w $^

