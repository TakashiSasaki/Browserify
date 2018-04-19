# target.mk

targetYes.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ $< -r ./modules/hello.js:helloTarget -r ./modules/goodbye.js:goodbyeTarget

targetNo.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ $< -r ./modules/hello.js -r ./modules/goodbye.js

target.diff: requireYes.bundled targetYes.bundled 
	-cd bundled; diff -w -B -c $^ >$@

target: targetNo.log targetYes.log target.diff targetNo.chrome targetYes.chrome

