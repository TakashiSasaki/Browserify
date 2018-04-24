const log = console.log

log("node.js\t: start");

//log("require " + process.argv[2]);

log("node.js\t: typeof requrie = " + typeof require);

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

log("node.js\t: typeof module = " + typeof module);
if(typeof module === "object!") {
  log("node.js\t: typeof module.exports = " + typeof module.exports);
}//if
log("node.js\t: end");

