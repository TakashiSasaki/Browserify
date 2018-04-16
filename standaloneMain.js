const PREFIX = "standaloneMain.js";

function log(s) {
	console.log(PREFIX + "\t: " + s);
}//log

log("start");

function standaloneMainFunction(){
	log("standaloneMainFunction");
}//standaloneMainFunction

if(typeof module !== "undefined"){
	log("module = " + typeof module);
	log("module.exports = " + typeof module.exports);
	module.exports.standaloneMainFunction = standaloneMainFunction;
}//if

log("end");
