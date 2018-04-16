function log(s){
  console.log("entryYesTest.js\t: " + s);
}

log("start");
console.log("entryYesTest.js\t: require ./entryYes");
entryYesRequired = require("./entryYes");
log("typeof entryYesRequired = " + typeof entryYesRequired);
log("entryYesRequired has " + Object.keys(entryYesRequired));
log("typeof hello = " + typeof hello); 
log("typeof helloRequired = " + typeof helloRequired); 
log("helloRequired has " + Object.keys(helloRequired)); 
log("helloRequired.hello()");
helloRequired.hello();
log("typeof goodbyeRequired = " + typeof goodbyeRequired); 
log("goodbyeRequired has " + Object.keys(goodbyeRequired)); 
log("goodbyeRequired.goodbye()");
goodbyeRequired.goodbye();
log("end");

