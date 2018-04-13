console.log("standaloneMain.js\t: start");

function standaloneMain(){
	console.log("standaloneMain.js#standaloneMain\t: ");
}

console.log("standaloneMain.js\t: end");

if(typeof module === "object") module.exports = standaloneMain;

