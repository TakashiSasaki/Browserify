.PHONY: test prepare browserified push pull clean all test-entry diff-entry
NODE=NODE_PATH=$(NODE_PATH):. node

all: test 

test: browserified

BROWSERIFIED=browserified.js browserified-target.js browserified-require.js \
						 browserified-standalone.js browserified-standalone-target.js browserified-standalone-require.js \
						 entry.js noentry.js


push: $(BROWSERIFIED)
	clasp push

pull:
	clasp pull

clean:
	@rm -rf $(BROWSERIFIED) tmp.js *.tmp

prepare:
	sudo n stable ;\
		sudo npm -g update ;\
		sudo npm -g install browserify js-beautify js-prettify @google/clasp

%.js: %.tmp
	js-beautify -f $< -o $@

browserified:  $(BROWSERIFIED)

entryYes.tmp: hello.js goodbye.js entryMain.js
	browserify -e entryMain -o $@ $^

test-entryYes: entryYes.js
	$(NODE) $<

entryNo.tmp : hello.js goodbye.js entryMain.js
	browserify -o $@ $^ 

test-entryNo: entryNo.js
	$(NODE) $<

diff-entry: entryNo.js entryYes.js
	diff $^

require.js: hello.js goodbye.js empty.js
	browserify -r ./hello.js -r ./goodbye.js -o tmp.js empty.js ;\
	js-beautify -f tmp.js -o $@ ;\
	$(NODE) $@

test-browserified-require: test-browserified-require.js browserified-require.js
	$(NODE) $<

browserified-target.js: hello.js goodbye.js
	browserify -r ./hello.js:hellotarget -r ./goodbye.js:goodbyetarget -o tmp.js empty.js ;\
	js-beautify -f tmp.js -o $@ ;\
	$(NODE) $@

browserified-standalone-require.js: hello.js goodbye.js
	browserify -s greeting -r ./hello.js -r ./goodbye.js -o tmp.js empty.js ;\
	js-beautify -f tmp.js -o $@ ;\
	$(NODE) $@

browserified-standalone-target.js: hello.js goodbye.js
	browserify -s greeting -r ./hello.js:hellotarget -r ./goodbye.js:goodbyetarget -o tmp.js empty.js ;\
	js-beautify -f tmp.js -o $@ ;\
	$(NODE) $@

browserified-standalone.js: hello.js goodbye.js empty.js
	browserify -s greeting -o tmp.js $^ ;\
	js-beautify -f tmp.js -o $@ ;\
	$(NODE) $@

browserified.js: hello.js goodbye.js empty.js
	browserify -o tmp.js $^ ;\
	js-beautify -f tmp.js -o $@ ;\
	$(NODE) $@
