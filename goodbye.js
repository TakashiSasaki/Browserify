if(typeof Logger === "undefined") Logger = console;
Logger.log("goodbye.js\t: starts.");
Logger.log("goodbye.js\t: typeof require = " + typeof require);
Logger.log("goodbye.js\t: typeof module = " + typeof module);
Logger.log("goodbye.js\t: Object.keys(module) = " + Object.keys(module));
Logger.log("goodbye.js\t: typeof exports = " + typeof exports);
Logger.log("goodbye.js\t: Object.keys(exports) = " + Object.keys(exports));
function goodbye() {
  Logger.log("goodbye.js#goobye\t:");
}
if(typeof exports === "undefined") exports = {};
exports.goodbye = goodbye;
//goodbye();
Logger.log("goodbye.js\t: ends.");
