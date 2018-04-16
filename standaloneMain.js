const PREFIX = "standaloneMain";

function log(s) {
	console.log(PREFIX + ".js\t: " + s);
}//log

log("start");

log("requiring ./modules/hello.js");
helloRequireResult = require("./modules/hello.js");
log("helloRequireResult has " + JSON.stringify(Object.keys(helloRequireResult)));
log("hello = " + typeof hello);

log("requiring ./modules/goodbye.js");
goodbyeRequireResult = require("./modules/goodbye.js");
log("goodbyeRequireResult has " + JSON.stringify(Object.keys(goodbyeRequireResult)));
log("goodbye = " + typeof goodbye);

function mainFunction(){
	log("standaloneMainFunction");
}//mainFunction

log("module = " + typeof module);
log("module.exports = " + typeof module.exports);

if(typeof module !== "undefined"){
	module.exports.mainFunction = mainFunction;
}//if

log("end");
