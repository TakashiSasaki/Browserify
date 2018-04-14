targetYes.ugly: requireMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $< -r ./modules/hello.js:helloTarget -r ./modules/goodbye.js:goodbyeTarget

targetYes: targetYes.js
	$(NODE) $<

targetYesTest: targetYesTest.js targetYes.js
	$(NODE) $<

targetDiff: requireYes.js targetYes.js 
	-diff -w -B -c $^

target: targetYes targetYesTest targetDiff

