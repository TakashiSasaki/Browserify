console.log("entryMain.js\t: start");

function entryMain(){
  console.log("entryMain.js#entryMain\t: I'm entryMain() in entryMain.js.");
}


function entryRequire(){
	console.log("entryMain.js#entryRequire\t: require('./hello')");
  var helloRequire = require("./hello");
	console.log("entryMain.js#entryRequire\t: require('./goodbye')");
  var goodbyeRequire = require("./goodbye");
}

console.log("entryMain.js\t: end");
