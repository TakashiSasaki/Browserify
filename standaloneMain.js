const PREFIX = "standaloneMain.js";

function log(s) {
	console.log(PREFIX + "\t: " + s);
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

function standaloneMainFunction(){
	log("standaloneMainFunction");
}//standaloneMainFunction

if(typeof module !== "undefined"){
	log("module = " + typeof module);
	log("module.exports = " + typeof module.exports);
	module.exports.standaloneMainFunction = standaloneMainFunction;
}//if

log("end");
