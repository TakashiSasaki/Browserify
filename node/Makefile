.PHONY: all
	
.SUFFIXES: .bundled .log

vpath %.bundled ../bundled

all: entryNo.log entryYes.log standaloneNo.log standaloneYes.log \
	targetNo.log targetYes.log requireNo.log requireYes.log

clean:
	-rm -rf *.log

.bundled.log: 
	NODE_PATH=/usr/local/lib/node_modules:../bundled node node.js $< >$@

