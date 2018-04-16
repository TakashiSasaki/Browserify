const PREFIX = "entryMain";

function log(s) {
  console.log(PREFIX + ".js\t: " + s);
}//log

log("start");

log("requiring ./modules/hello.js");
helloRequireResult = require("./modules/hello.js");
log("hello = " + typeof hello);
log("helloRequireResult = " + typeof helloRequireResult);
log("helloRequireResult has " + Object.keys(helloRequireResult));

log("requiring ./modules/goodbye.js");
goodbyeRequireResult = require("./modules/goodbye.js");
log("goodbye = " + typeof goodbye);
log("goodbyeRequireResult = " + typeof goodbyeRequireResult);
log("goodbyeRequireResult has " + Object.keys(goodbyeRequireResult));

hogehoge = "hogehoge";

function mainFunction(){
  log("start");
  log("helloRequire.hello()");
  helloRequire.hello();
  log("goodbyeRequire.goodbye()");
  goodbyeRequire.goodbye();
  log("end");
}

log("module = " + typeof module);
log("module.exports = " + typeof module.exports);

if(typeof module !== "undefined") {
	module.exports.mainFunction = mainFunction;
}

log("end");

