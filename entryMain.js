console.log("entryMain.js\t: start");

console.log("entryMain.js\t: requiring ./modules/hello.js");
helloRequired = require("./modules/hello.js");
console.log("entryMain.js\t: typeof hello = " + typeof hello);
console.log("entryMain.js\t: typeof helloRequired = " + typeof helloRequired);
console.log("entryMain.js\t: keys of helloRequired = " + Object.keys(helloRequired));

console.log("entryMain.js\t: requiring ./modules/goodbye.js");
goodbyeRequired = require("./modules/goodbye.js");
console.log("entryMain.js\t: typeof goodbye = " + typeof goodbye);
console.log("entryMain.js\t: typeof goodbyeRequired = " + typeof goodbyeRequired);
console.log("entryMain.js\t: keys of goodbyeRequired = " + Object.keys(goodbyeRequired));

function entryMainFunction(){
  console.log("entryMainFunction:");
  console.log("entryMain.js#entryMainFunction\t: helloRequired.hello()");
  helloRequired.hello();
  console.log("entryMain.js#entryMainFunction\t: goodbyeRequired.goodbye()");
  goodbyeRequiredgoodbye();
}

console.log("entryMain.js\t: end");

