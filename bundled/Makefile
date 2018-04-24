.PHONY: clean diff

diff: entryYes.diff entryDummy.diff \
	externalYes.diff externalDummy.diff \
	standalone.diff \
	requireYes.diff requireDummy.diff requireHello.diff requireHello.diff requireTarget.diff \
	target.diff

clean:
	-rm -rf *.bundled *.diff

entryYes.diff: entryNo.bundled entryYes.bundled
	-diff -w -B -c $^ >$@

entryDummy.diff :entryNo.bundled entryDummy.bundled
	-diff -w -B -c $^ >$@

externalYes.diff: externalNo.bundled externalYes.bundled
	-diff -w -B -c $^ >$@

externalDummy.diff: externalNo.bundled externalDummy.bundled
	-diff -w -B -c $^ >$@

standalone.diff : standaloneNo.bundled standaloneYes.bundled
	-diff -w -B -c $^ >$@

requireYes.diff: requireNo.bundled requireYes.bundled 
	-diff -w -B -c $^ >$@

requireDummy.diff: requireNo.bundled requireDummy.bundled
	-diff -w -B -c $^ >$@

requireHello.diff: requireNo.bundled requireHello.bundled
	-diff -w -B -c $^ >$@

requireTarget.diff: requireNo.bundled requireTarget.bundled
	-diff -w -B -c $^ >$@

target.diff: requireYes.bundled targetYes.bundled 
	-diff -w -B -c $^ >$@


