console.log("requireNoTest.js\t: start");
var requireReturn = require("requireNo");
console.log("requireNoTest.js\t: typeof requireReturn = " + typeof requireReturn);
console.log("requireNoTest.js\t: Object.keys(requireReturn) = " + JSON.stringify(requireReturn));
console.log("requireNoTest.js\t: end");
