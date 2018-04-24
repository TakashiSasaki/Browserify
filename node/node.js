const log = console.log;

log("start");

//log("require " + process.argv[2]);

z = require(process.argv[2]);
log("node.js\t: z = require('" + process.argv[2] + "')");
log("node.js\t: typeof z = " + typeof requireResult);
log("node.js\t: keys of z = " + JSON.stringify(Object.keys(requireResult)));

log("node.js\t: typeof h = " + typeof h);
log("node.js\t: typeof g = " + typeof g);
log("node.js\t: typeof mainFunction = " + typeof mainFunction);
log("node.js\t: typeof hoge = " + typeof hoge);
log("node.js\t: typeof module = " + typeof module);
log("node.js\t: typeof module.exports = " + typeof module.exports);
log("node.js\t: end");

