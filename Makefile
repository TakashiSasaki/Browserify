.PHONY: prepare push pull clean all mkdir
.SUFFIXES: .patched .ugly .js .beautiful .bundled .nodejs .nodelog .diff .chromelog
.INTERMEDIATE: %.ugly

vpath %.log 			./log
vpath %.ugly 			./tmp
vpath %.beautiful ./tmp
vpath %.patched 	./tmp
vpath %.bundled 	./bundled
vpath %.patch			./patch

NODE=NODE_PATH=$(NODE_PATH):./bundled node

all: entry standalone require target

mkdir:
	@-mkdir tmp bundled log

push: $(BROWSERIFIED)
	clasp push

pull:
	clasp pull

clean:
	@rm -rf *.ugly *.beautiful *.patched *.rej *.bundled .*.swp *.tmp *.log *.chrome *lighthouse* bundled/ log/ tmp/ chrome/

prepare:
	sudo n stable ;\
		sudo npm -g update ;\
		sudo npm -g install browserify js-beautify js-prettify @google/clasp myassert runinchrome

# ugly => beautiful => patched => bundled

.ugly.beautiful: mkdir
	js-beautify -f tmp/$< -o tmp/$@

.beautiful.patched: mkdir
	patch -o tmp/$@ tmp/$< patch/$*.patch

.patched.bundled: mkdir
	js-beautify -f tmp/$< -o bundled/$@

.bundled.nodelog: mkdir
	$(NODE) node.js $< >log/$@

.bundled.chromelog: mkdir
	cd bundled ; runinchrome $< ../chrome.js >../log/$@

entryYes.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ -e entryMain $^

entryNo.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ $^

entry.diff: entryYes.bundled entryNo.bundled
	-cd bundled; diff -w -B -c $^ >$@

entry: entryNo.nodelog entryYes.nodelog entry.diff entryNo.chromelog entryYes.chromelog

standaloneNo.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ $^ 

standaloneYes.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -s hoge -o tmp/$@ $^ 

standalone.diff : standaloneNo.bundled standaloneYes.bundled
	-cd bundled; diff -w -B -c $^ >$@

standalone: standaloneNo.nodelog standaloneYes.nodelog standalone.diff standaloneNo.chromelog standaloneYes.chromelog

requireYes.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ $< -r ./modules/hello.js -r ./modules/goodbye.js

requireNo.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ $<

require.diff: requireNo.bundled requireYes.bundled 
	-cd bundled; diff -w -B -c $^ >$@

require: requireNo.nodelog requireYes.nodelog require.diff requireNo.chromelog requireYes.chromelog

targetYes.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ $< -r ./modules/hello.js:helloTarget -r ./modules/goodbye.js:goodbyeTarget

targetNo.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ $< -r ./modules/hello.js -r ./modules/goodbye.js

target.diff: requireYes.bundled targetYes.bundled 
	-cd bundled; diff -w -B -c $^ >$@

target: targetNo.nodelog targetYes.nodelog target.diff targetNo.chromelog targetYes.chromelog

