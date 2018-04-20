function log(s,o){
	if(typeof o === "undefined") {
		console.log(s);
	} else if(typeof o === "object" && o !== null) {
		console.log(s + "\t has " + JSON.stringify(Object.keys(o)));
  } else {
		console.log(s + "\t is  " + typeof o);
	}//if
}//log

log("start");

////////////////////////////////////////////
helloNoVar = undefined;
try {
  helloNoVar = require("helloTarget");
} catch (e){
	helloNoVar = require("./hello.js");
}
log("helloNoVar", helloNoVar);

////////////////////////////////////////////
var goodbyeTargetVar = undefined;
try {
	goodbyeVar = require("goodbyeTarget");
} catch (e){
	goodbyeVar = require("./hello.js");
}
log("goodbyeVar", goodbyeVar);

////////////////////////////////////////////
log("typeof hello = " + typeof hello);
log("typeof goodbye = " + typeof goodbye);

function mainFunction(){
	log("mainFunction");
}//mainFunction

log("module = " + typeof module);
log("module.exports = " + typeof module.exports);

if(typeof module !== "undefined") {
	module.exports.mainFunction = mainFunction;
}//if

log("end");

