const log = console.log;

log("external.js\t: start");

log("external.js\t: typeof module = " + typeof module);

if(typeof modules === "object") {
  log("external.js\t: typeof module.exports = " + typeof module.exports);
}//if

log("external.js\t: end");

