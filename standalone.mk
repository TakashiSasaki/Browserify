# standalone.mk

standaloneNo.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ $^ 

standaloneYes.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -s hoge -o tmp/$@ $^ 

standalone.diff : standaloneNo.bundled standaloneYes.bundled
	-cd bundled; diff -w -B -c $^ >$@

standalone: standaloneNo.log standaloneYes.log standalone.diff standaloneNo.chrome standaloneYes.chrome

