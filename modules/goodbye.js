if(typeof Logger === "undefined") Logger = console;
Logger.log("goodbye.js\t: start");
//Logger.log("goodbye.js\t: typeof require = " + typeof require);
//Logger.log("goodbye.js\t: typeof module = " + typeof module);
//Logger.log("goodbye.js\t: Object.keys(module) = " + Object.keys(module));
//Logger.log("goodbye.js\t: typeof exports = " + typeof exports);
//Logger.log("goodbye.js\t: Object.keys(exports) = " + Object.keys(exports));

function goodbye() {
  Logger.log("goodbye.js#goodbye\t:");
}

if(typeof module !== "undefined") {
  module.exports.goodbye = goodbye;
}

Logger.log("goodbye.js\t: ends");
