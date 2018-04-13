function entryMain(){
  console.log("entryMain.js#entryMain\t: I'm entryMain() in entryMain.js.");
}

console.log("entryMain.js\t: I'm bare code line in entryMain.js.");

function entryRequire(){
	console.log("entryMain.js#entryRequire\t: require('./hello')");
  var helloRequire = require("./hello");
	console.log("entryMain.js#entryRequire\t: require('./goodbye')");
  var goodbyeRequire = require("./goodbye");
}

