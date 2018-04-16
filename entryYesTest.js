console.log("entryYesTest.js\t: start");
console.log("entryYesTest.js\t: require ./entryYes");
entryYesRequired = require("./entryYes");
console.log("entryYesTest.js\t: typeof entryYesRequired = " + typeof entryYesRequired);
console.log("entryYesTest.js\t: entryYesRequired has " + Object.keys(entryYesRequired));
console.log("entryYesTest.js\t: typeof hello = " + typeof hello); 
console.log("entryYesTest.js\t: typeof helloRequired = " + typeof helloRequired); 
console.log("entryYesTest.js\t: helloRequired has " + Object.keys(helloRequired)); 
console.log("entryYesTest.js\t: helloRequired.hello()");
helloRequired.hello();
console.log("entryYesTest.js\t: typeof goodbyeRequired = " + typeof goodbyeRequired); 
console.log("entryYesTest.js\t: goodbyeRequired has " + Object.keys(goodbyeRequired)); 
console.log("entryYesTest.js\t: goodbyeRequired.goodbye()");
goodbyeRequired.goodbye();
console.log("entryYesTest.js\t: end");

