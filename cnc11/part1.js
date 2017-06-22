var parseNumbers = function(intStrs) {
  return intStrs.map(parseInt);
}


var parseNumbers = function(intStrs) {
  return intStrs.map(function(x) {return parseInt(x);});
}
