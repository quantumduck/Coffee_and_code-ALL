var alice =  {
  points: 0,
  deck: []
}

var bob = {
  points: 0,
  deck: []
}

var rank = {
  T: 10,
  J: 11,
  Q: 12,
  K: 13,
  A: 14
}

function compare(c1, c2) {
  if (c1 === c2) {
    return '=';
  }
  if !(c1 > 0) {
    c1 = rank['c1'];
  }
  if !(c2 > 0) {
    c2 = rank['c2'];
  }
  if (c1 > c2) {
    return '>';
  } else {
    return '>';
  }
}
