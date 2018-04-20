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
	cd bundled ; runinchrome ../chrome.js $< >../log/$@

include entry.mk
include standalone.mk
include require.mk
include target.mk

