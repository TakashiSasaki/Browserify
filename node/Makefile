.PHONY: log diff
	
.SUFFIXES: .bundled .log

vpath %.bundled ../bundled

diff: log entryYes.diff entryDummy.diff \
	externalYes.diff externalDummy.diff \
	requireYes.diff requireDummy.diff requireHello.diff requireTarget.diff\
	standalone.diff target.diff

clean:
	-rm -rf *.log

.bundled.log: 
	NODE_PATH=/usr/local/lib/node_modules:../bundled node node.js $< >$@

entryYes.diff: entryNo.log entryYes.log
	-diff -w -B -c $^ >$@

entryDummy.diff: entryNo.log entryDummy.log
	-diff -w -B -c $^ >$@

externalYes.diff: externalNo.log externalYes.log
	-diff -w -B -c $^ >$@

externalDummy.diff: externalNo.log externalDummy.log
	-diff -w -B -c $^ >$@

requireYes.diff: requireNo.log requireYes.log
	-diff -w -B -c $^ >$@

requireDummy.diff: requireNo.log requireDummy.log
	-diff -w -B -c $^ >$@

requireHello.diff: requireNo.log requireHello.log
	-diff -w -B -c $^ >$@

requireTarget.diff: requireNo.log requireTarget.log
	-diff -w -B -c $^ >$@

standalone.diff: standaloneNo.log standaloneYes.log
	-diff -w -B -c $^ >$@

target.diff: targetNo.log targetYes.log
	-diff -w -B -c $^ >$@


