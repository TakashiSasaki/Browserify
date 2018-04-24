const log = console.log

log("node.js\t: start");

//log("require " + process.argv[2]);

if(typeof process !== "undefined") {
  log("node.js\t: x = require('" + process.argv[2] + "')");
  x = require(process.argv[2]);
  log("node.js\t: typeof x = " + typeof x);
  log("node.js\t: keys of x = " + JSON.stringify(Object.keys(x)));
}//if

log("node.js\t: typeof h = " + typeof h);
log("node.js\t: typeof g = " + typeof g);
log("node.js\t: typeof mainFunction = " + typeof mainFunction);

log("node.js\t: typeof hoge = " + typeof hoge);
if(typeof hoge === "object") {
  log("node.js\t: keys of hoge = " + JSON.stringify(Object.keys(hoge)));
}//if

log("node.js\t: typeof require = " + typeof require);
if(typeof require !== "undefined") {
  (function(){
    try{
      log("node.js\t: y = require('./hello.js')");
      var y = require("./hello.js");
      log("node.js\t: y = require('./hello.js') succeeded.");
      log("node.js\t: keys of y = " + JSON.stringify(Object.keys(y)));
    }catch(e){
      log("node.js\t: y = require('./hello.js') failed");
    }//try
  })();
  (function(){
    try{
      log("node.js\t: y = require('./goodbye.js')");
      var y = require("./goodbye.js");
      log("node.js\t: y = require('./goodbye.js') succeeded.");
      log("node.js\t: keys of y = " + JSON.stringify(Object.keys(y)));
    }catch(e){
      log("node.js\t: y = require('./goodbye.js') failed.");
    }//try
  })();
  (function(){
    try{
      log("node.js\t: y = require('helloTarget')");
      var y = require("helloTarget");
      log("node.js\t: y = require('helloTarget') succeeded.");
      log("node.js\t: keys of y = " + JSON.stringify(Object.keys(y)));
    }catch(e){
      log("node.js\t: y = require('helloTarget') failed.");
    }//try
  })();
  (function(){
    try{
      log("node.js\t: y = require('goodbyeTarget')");
      var y = require("goodbyeTarget");
      log("node.js\t: y = require('goodbyeTarget') succeeded.");
      log("node.js\t: keys of y = " + JSON.stringify(Object.keys(y)));
    }catch(e){
      log("node.js\t: y = require('goodbyeTarget') failed.");
    }//try
  })();
}//if

log("node.js\t: typeof module = " + typeof module);
if(typeof module === "object!") {
  log("node.js\t: typeof module.exports = " + typeof module.exports);
}//if
log("node.js\t: end");

