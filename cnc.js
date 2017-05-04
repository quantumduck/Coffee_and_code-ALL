var color = ["Blue", "Green", "Red", "Orange", "Violet", "Indigo", "Yellow"];
var order = ["th", "st", "nd", "rd"];

function printOrder(names, suffixes) {
  for (var i = 1; i <= names.length; i++) {
    var str = "" + i;
    switch(i % 100) {
      case 11:
      case 12:
      case 13:
        str += suffixes[0];
        break;
      default:
        switch(i % 10) {
          case 1:
          case 2:
          case 3:
            str += suffixes[i];
            break;
          default:
            str += suffixes[0];
      }
    }
    str += " choice is ";
    str += names[i - 1];
    console.log(str);
  }
}

console.log("Array Manipulation");
printOrder(color, order);


var today = new Date;

function weekday(day) {
  var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
  return days[day];
}

console.log('\nJS Current Date');
// document.body.innerHTML = "Today is: " + weekday(today.getDay()) + '.  Current time is: ' + today.getHours() + ':' + today.getMinutes() + ':' + today.getSeconds() + '.';
console.log("Today is: " + weekday(today.getDay()) + '.  Current time is: ' + today.getHours() + ':' + today.getMinutes() + ':' + today.getSeconds() + '.');
