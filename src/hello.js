function log(s) {
	if(typeof console === "undefined") {
		Logger.log(s);
	} else {
		console.log(s);
	}//if
}//log

log("hello.js\t: start");

function helloFunction() {
	log("hello.js\t: helloFunction");
}//helloFunction

log("hello.js\t: typeof module = " + typeof module);
log("hello.js\t: typeof module.exports = " + typeof module.exports);

if(typeof module !== "undefined") {
  module.exports.helloFunction = helloFunction;
}

log("hello.js\t: end");


