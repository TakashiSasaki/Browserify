# standalone.mk

standaloneNo.ugly: main.js modules/hello.js modules/goodbye.js
	browserify --im -o $@ $^ 

standaloneYes.ugly: main.js modules/hello.js modules/goodbye.js
	browserify --im -s hoge -o $@ $^ 

standalone.diff : standaloneNo.bundled standaloneYes.bundled
	-diff -w -B -c $^

standalone: standaloneNo.log standaloneYes.log standalone.diff standaloneNo.chrome standaloneYes.chrome

