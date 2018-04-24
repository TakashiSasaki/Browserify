const log = console.log;

log("main.js\t: start");

////////////////////////////////////////////

h = undefined;
try {
  h = require("helloTarget");
  log("main.js\t: h = require('helloTarget')");
} catch (e){
	h = require("./hello.js");
  log("main.js\t: h = require('./hello.js')");
}//try
log("main.js\t: typeof h = " + typeof h);

////////////////////////////////////////////
var g = undefined;
try {
	g = require("goodbyeTarget");
  log("main.js\t: var g = require('goodbyeTarget')");
} catch (e){
	g = require("./goodbye.js");
  log("main.js\t: var g = require('./goodbye.js')");
}//try
log("main.js\t: typeof g = " + typeof g);

////////////////////////////////////////////
log("main.js\t: typeof hello = " + typeof hello);
log("main.js\t: typeof goodbye = " + typeof goodbye);

log("main.js\t: function mainFunction");
function mainFunction(){
	log("main.js\t: I'm mainFunction.");
}//mainFunction

log("main.js\t: typeof module = " + typeof module);
log("main.js\t: typeof module.exports = " + typeof module.exports);

if(typeof module !== "undefined") {
  log("main.js\t: module.exports.mainFunction = mainFunction");
	module.exports.mainFunction = mainFunction;
}//if

log("main.js\t: end");
