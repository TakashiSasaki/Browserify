function log(s){
  console.log("entryNoTest.js\t: " + s);
}

log("start");
log("require ./entryYes");
requireResult = require("./entryYes");
log("requireResult = " + typeof requireResult);
log("requireResult has " + JSON.stringify(Object.keys(requireResult)));
log("hello = " + typeof hello); 
log("helloRequired has " + JSON.stringify(Object.keys(helloRequired))); 
log("helloRequired.hello()");
helloRequired.hello();
log("typeof goodbyeRequired = " + typeof goodbyeRequired); 
log("goodbyeRequired has " + Object.keys(goodbyeRequired)); 
log("goodbyeRequired.goodbye()");
goodbyeRequired.goodbye();
log("end");

