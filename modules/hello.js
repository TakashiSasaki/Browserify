const PREFIX = "modules/hello.js\t: ";

function log(s) {
	if(typeof console === "undefined") {
		Logger.log(PREFIX + s);
	} else {
		console.log(PREFIX + s);
	}//if
}//log

log("start");

function helloFunction() {
	log("helloFunction");
}//helloFunction

log("module = " + typeof module);
log("module.exports = " + typeof module.exports);

if(typeof module !== "undefined") {
  module.exports.helloFunction = helloFunction;
}

log("end");
