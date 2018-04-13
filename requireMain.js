var helloRequired = require("./hello");
console.log("requireMain.js\t: " + helloRequired);
console.log("requireMain.js\t: " + Object.keys(helloRequired));
var goodbyeRequired = require("./goodbye");
console.log("requireMain.js\t: " + goodbyeRequired);
console.log("requireMain.js\t: " + Object.keys(goodbyeRequired));

