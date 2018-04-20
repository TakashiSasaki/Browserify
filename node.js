const log = console.log

log("start");

//log("require " + process.argv[2]);

requireResult = require(process.argv[2]);

log("requireResult = " + typeof requireResult);
log("requireResult has " + JSON.stringify(Object.keys(requireResult)));
log("helloNoVar = " + typeof helloNoVar);
log("goodbyeVar = " + typeof goodbyeVar);
log("mainFunction = " + typeof mainFunction);
log("hoge = " + typeof hoge);
log("module = " + typeof module);
log("module.exports = " + typeof module.exports);
log("end");

