const PREFIX = "requireMain.js"

function log(s) {
	console.log(s + "\t: " + s);
}//log

function requireMainFunction() {
	log("requireMainFunction");
}//requireMainFunction

log("start");
helloRequireResult = require("./modules/hello.js");
goodbyeRequireResult = require("./modules/goodbye.js");

if(typeof module !== "undefined") {
	module.exports.requireMainFunction = requireMainFunction;
}

log("end");

