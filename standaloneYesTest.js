console.log("standaloneYesTest.js\t: start");
console.log("standaloneYesTest.js\t: var requireReturn = require('standaloneYes')");
var requireReturn = require("standaloneYes");
console.log("standaloneYesTest.js\t: typeof requireReturn = " + typeof requireReturn);
console.log("standaloneYesTest.js\t: Object.keys(requireReturn) = " + JSON.stringify(Object.keys(requireReturn)));
console.log("standaloneYesTest.js\t: typeof standaloneYes = " + typeof standaloneYes);
console.log("standaloneYesTest.js\t: end");
