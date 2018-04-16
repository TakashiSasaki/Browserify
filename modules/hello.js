if(typeof Logger === "undefined") Logger = console;
Logger.log("hello.js\t: start");
//Logger.log("hello.js\t: typeof require = " + typeof require);
//Logger.log("hello.js\t: typeof module = " + typeof module);
//Logger.log("hello.js\t: Object.keys(module) = " + Object.keys(module));
//Logger.log("hello.js\t: typeof exports = " + typeof exports);
//Logger.log("hello.js\t: Object.keys(exports) = " + Object.keys(exports));
//
function hello() {
  Logger.log("hello.js#hello\t: ");
}//hello

if(typeof module !== "undefined") {
  module.exports.hello = hello;
}

Logger.log("hello.js\t: end");

