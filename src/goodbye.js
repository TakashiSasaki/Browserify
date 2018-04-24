function log(s) {
	if(typeof console === "undefined") {
		Logger.log(s);
	} else {
		console.log(s);
	}//if
}//log

log("goodbye.js\t: start");

function goodbyeFunction() {
  log("goodbyeFunction");
}//goodbyeFunction

log("goodbye.js\t: typeof module = " + typeof module);
log("goodbye.js\t: typeof module.exports = " + typeof module.exports);

if(typeof module !== "undefined") {
  module.exports.goodbyeFunction = goodbyeFunction;
}//if

log("goodbye.js\t: end");

