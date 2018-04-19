const PREFIX = "module/goodbye.js\t ";

function log(s) {
	if(typeof console === "undefined") {
		Logger.log(PREFIX + s);
	} else {
		console.log(PREFIX + s);
	}//if
}//log

log("start");

function goodbyeFunction() {
  log("goodbyeFunction");
}//goodbyeFunction

log("module = " + typeof module);
log("module.exports = " + typeof module.exports);

if(typeof module !== "undefined") {
  module.exports.goodbyeFunction = goodbyeFunction;
}//if

log("end");
