console.log("requireYesTest.js\t: start");
var requireYes = require("requireYes");
console.log("requireYesTest.js\t: typeof requireYes = " + typeof requireReturn);
console.log("requireYesTest.js\t: Object.keys(requireYes) = " + JSON.stringify(requireYes));
var hello = require("hello");
console.log("requireYesTest.js\t: typeof hello = " + typeof hello);
console.log("requireYesTest.js\t: Object.keys(hello) = " + JSON.stringify(hello));
console.log("requireYesTest.js\t: end");

