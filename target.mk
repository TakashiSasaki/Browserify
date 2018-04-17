# target.mk

targetYes.ugly: main.js modules/hello.js modules/goodbye.js
	browserify --im -o $@ $< -r ./modules/hello.js:helloTarget -r ./modules/goodbye.js:goodbyeTarget

targetNo.ugly: main.js modules/hello.js modules/goodbye.js
	browserify --im -o $@ $< -r ./modules/hello.js -r ./modules/goodbye.js

target.diff: requireYes.bundled targetYes.bundled
	-diff -w -B -c $^

target: targetNo.log targetYes.log target.diff

