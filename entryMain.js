const PREFIX = "entryMain";
function log(s) {
  console.log(PREFIX + "\t: " + s);
}

log("start");

log("requiring ./modules/hello.js");
helloRequiredResult = require("./modules/hello.js");
log("typeof hello = " + typeof hello);
log("typeof helloRequiredResult = " + typeof helloRequiredResult);
log("keys of helloRequiredResult = " + Object.keys(helloRequiredResult));

log("requiring ./modules/goodbye.js");
goodbyeRequiredResult = require("./modules/goodbye.js");
log("typeof goodbye = " + typeof goodbye);
log("typeof goodbyeRequiredResult = " + typeof goodbyeRequiredResult);
log("keys of goodbyeRequiredResult = " + Object.keys(goodbyeRequiredResult));

function entryMainFunction(){
  const PREFIX = "entryMainFunction";
  function log(s) {
    console.log(PREFIX + "\t: " + s);
  }
  log("start");
  log("helloRequired.hello()");
  helloRequired.hello();
  log("goodbyeRequired.goodbye()");
  goodbyeRequired.goodbye();
  log("end");
}

module.exports.entryMainFunction = entryMainFunction;

log("end");

