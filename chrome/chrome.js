//var x = 1;
//Object.keys(window).toString();

const x = {};
x["typeof require"] = typeof require;
x["typeof h"] = typeof h;
x["typeof g"] = typeof g;
x["typeof mainFunction"] = typeof mainFunction;
x["typeof hoge"] = typeof hoge;
x["typeof module"] = typeof module;
//x["typeof module.exports"] = typeof module.exports;
JSON.stringify(x);

