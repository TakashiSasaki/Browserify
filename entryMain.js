function entryMain(){
  console.log("entryMain#entryMain: I'm entryMain() in entryMain.js.");
}

console.log("I'm bare code line in entryMain.js.");

function entryRequire(){
	console.log("entryMain#entryRequire: require('./hello')");
  var helloRequire = require("./hello");
	console.log("entryMain#entryRequire: require('./goodbye')");
  var goodbyeRequire = require("./goodbye");
}

