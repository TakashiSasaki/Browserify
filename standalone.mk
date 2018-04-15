# Makefile-standalone

standaloneNo.ugly: standaloneMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $^ 

standaloneYes.ugly: standaloneMain.js modules/hello.js modules/goodbye.js
	browserify -s hoge -o $@ $^ 

standaloneNo: standaloneNo.js
	$(NODE) $<

standaloneYes: standaloneYes.js
	$(NODE) $<

standaloneNoTest: standaloneNoTest.js standaloneNo.js
	$(NODE) $<

standaloneYesTest: standaloneYesTest.js standaloneYes.js
	$(NODE) $<

standaloneDiff: standaloneNo.js standaloneYes.js
	-diff -w -B -c $^

standaloneYes.patch: standaloneYes.beautiful standaloneYes.js
	-diff -c $^

standalone: standaloneNo standaloneYes standaloneNoTest standaloneYesTest standaloneDiff

