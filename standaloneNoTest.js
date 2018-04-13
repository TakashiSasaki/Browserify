console.log("standaloneNoTest.js\t: start");
console.log("standaloneNoTest.js\t: requireReturn = rquire('standaloneNo')");
var requireReturn = require("standaloneNo");
console.log("standaloneNoTest.js\t: typeof standaloneMain = " + typeof standaloneMain);
console.log("standaloneNoTest.js\t: typeof requireReturn = " + typeof requireReturn);
console.log("standaloneNoTest.js\t: Object.keys(requireReturn) = " + JSON.stringify(Object.keys(requireReturn)));
console.log("standaloneNoTest.js\t: end");

