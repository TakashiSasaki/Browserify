const log = console.log;

log("main.js\t: start");

////////////////////////////////////////////

h = undefined;
try {
  log("main.js\t: h = require('helloTarget')");
  h = require("helloTarget");
  log("main.js\t: h = require('helloTarget') succeeded.");
} catch (e){
  log("main.js\t: h = require('helloTarget') failed");
  log("main.js\t: h = require('./hello.js')");
	h = require("./hello.js");
  log("main.js\t: h = require('./hello.js') succeeded.");
}//try
log("main.js\t: typeof h = " + typeof h);

if(typeof h === "object") {
	log("main.js\t: keys of h = " + JSON.stringify(Object.keys(h)));
}//if

////////////////////////////////////////////
var g = undefined;
try {
  log("main.js\t: var g = require('goodbyeTarget')");
	g = require("goodbyeTarget");
  log("main.js\t: var g = require('goodbyeTarget') succeeded.");
} catch (e){
  log("main.js\t: var g = require('goodbyeTarget') failed.");
  log("main.js\t: var g = require('./goodbye.js')");
	g = require("./goodbye.js");
  log("main.js\t: var g = require('./goodbye.js') succeeded.");
}//try
log("main.js\t: typeof g = " + typeof g);

if(typeof g === "object") {
	log("main.js\t: keys of g = " + JSON.stringify(Object.keys(g)));
}//if

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

