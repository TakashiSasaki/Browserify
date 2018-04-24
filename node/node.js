const log = console.log

log("node.js\t: start");

//log("require " + process.argv[2]);

log("node.js\t: x = require('" + process.argv[2] + "')");
x = require(process.argv[2]);

log("node.js\t: typeof x = " + typeof x);
log("node.js\t: keys of x = " + JSON.stringify(Object.keys(x)));

log("node.js\t: typeof h = " + typeof h);
log("node.js\t: typeof g = " + typeof g);
log("node.js\t: typeof mainFunction = " + typeof mainFunction);
log("node.js\t: typeof hoge = " + typeof hoge);
log("node.js\t: typeof module = " + typeof module);
log("node.js\t: typeof module.exports = " + typeof module.exports);
log("node.js\t: end");

