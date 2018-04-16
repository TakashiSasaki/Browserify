const PREFIX = "entryMain";

function log(s) {
  console.log(PREFIX + "\t: " + s);
}

log("start");

log("requiring ./modules/hello.js");
helloRequireResult = require("./modules/hello.js");
log("typeof hello = " + typeof hello);
log("typeof helloRequireResult = " + typeof helloRequireResult);
log("keys of helloRequireResult = " + Object.keys(helloRequireResult));

log("requiring ./modules/goodbye.js");
goodbyeRequireResult = require("./modules/goodbye.js");
log("typeof goodbye = " + typeof goodbye);
log("typeof goodbyeRequireResult = " + typeof goodbyeRequireResult);
log("keys of goodbyeRequireResult = " + Object.keys(goodbyeRequireResult));

function entryMainFunction(){
  const PREFIX = "entryMainFunction";
  function log(s) {
    console.log(PREFIX + "\t: " + s);
  }
  log("start");
  log("helloRequire.hello()");
  helloRequire.hello();
  log("goodbyeRequire.goodbye()");
  goodbyeRequire.goodbye();
  log("end");
}

if(typeof module !== "undefined") {
	module.exports.entryMainFunction = entryMainFunction;
}

log("end");

