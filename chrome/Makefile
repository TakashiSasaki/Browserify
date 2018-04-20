.PHONY: all
.SUFFIXES: .bundled .log
	
vpath %.bundled ../bundled

all: entryNo.log entryYes.log standaloneNo.log standaloneYes.log \
	requireNo.log requireYes.log targetNo.log targetYes.log

clean: 
	-rm -rf *lighthouse* *.log

.bundled.log: 
	runinchrome $< chrome.js >$@

