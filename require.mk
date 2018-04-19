requireYes.ugly: main.js modules/hello.js modules/goodbye.js
	browserify --im -o $@ $< -r ./modules/hello.js -r ./modules/goodbye.js

requireNo.ugly: main.js modules/hello.js modules/goodbye.js
	browserify --im -o $@ $<

require.diff: requireNo.bundled requireYes.bundled
	-diff -w -B -c $^

require: requireNo.log requireYes.log require.diff requireNo.chrome requireYes.chrome

