const PREFIX = "targetMain";

function log(s){
	console.log(PREFIX + ".js\t :" + s);
}//log

log("start");

log("requiring helloTarget");
helloRequireResult = require("helloTarget");
log("helloRequireResult has " + JSON.stringify(Object.keys(helloRequireResult)));
log("hello = " + typeof hello);

log("requiring goodbyeTarget");
goodbyeRequireResult = require("goodbyeTarget");
log("goodbyeRequireResult has " + JSON.stringify(Object.keys(goodbyeRequireResult)));
log("goodbye = " + typeof goodbye);

function mainFunction(){
	log("mainFunction");
}//mainFunction

log("module = " + typeof module);
log("module.exports = " + typeof module.exports);

if(typeof module !== "undefined") {
	module.exports.mainFunction = mainFunction;
}//if

log("end");

