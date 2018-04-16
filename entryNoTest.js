const PREFIX = "entryNoTest.js";
function log(s){
  console.log(PREFIX + "\t: " + s);
}

log("start");
log("require ./entryYes");
requireResult = require("./entryNo");
log("requireResult has " + JSON.stringify(Object.keys(requireResult)));
log("entryMainFunction = " + typeof entryMainFunction);

log("hello = " + typeof hello); 
log("helloRequiredResult has " + JSON.stringify(Object.keys(helloRequiredResult))); 
log("helloRequired.hello()");
helloRequiredResult.hello();

log("hello = " + typeof goodbye); 
log("goodbyeRequiredResult has " + Object.keys(goodbyeRequiredResult)); 
log("goodbyeRequiredResult.goodbye()");
goodbyeRequiredResult.goodbye();
log("end");

