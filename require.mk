requireYes.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ $< -r ./modules/hello.js -r ./modules/goodbye.js

requireNo.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ $<

require.diff: requireNo.bundled requireYes.bundled 
	-cd bundled; diff -w -B -c $^ >$@

require: requireNo.log requireYes.log require.diff requireNo.chrome requireYes.chrome

