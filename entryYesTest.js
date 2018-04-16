const PREFIX = "entryYesTest.js";
function log(s){
  console.log(PREFIX + "\t: " + s);
}

log("start");

log("require ./entryYes");
requireResult = require("./entryYes");
log("requireResult has " + JSON.stringify(Object.keys(requireResult)));
log("entryMainFunction = " + typeof entryMainFunction);


log("hello = " + typeof hello); 
log("helloRequiredResult has " + JSON.stringify(Object.keys(helloRequiredResult))); 
log("helloRequiredResult.hello()");
helloRequiredResult.hello();


log("goodbye = " + typeof goodbye)
log("goodbyeRequiredResult has " + JSON.stringify(Object.keys(goodbyeRequiredResult))); 
log("goodbyeRequiredResult.goodbye()");
goodbyeRequiredResult.goodbye();
log("end");

