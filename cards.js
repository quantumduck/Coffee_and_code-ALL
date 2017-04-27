var alice =  {
  name: 'Alice',
  points: 0,
  deck: []
}

var bob = {
  name: 'Bob',
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
  if (!(c1 > 0)) {
    c1 = rank[c1];
  }
  if (!(c2 > 0)) {
    c2 = rank[c2];
  }
  if (c1 > c2) {
    return '>';
  } else {
    return '<';
  }
}


function winner(player1, player2) {
  var num_cards = player1.deck.length;
  if (player2.deck.length != num_cards) {
    console.log("Players have different numbers of cards.");
    return;
  }
  for (var i = 0; i < num_cards; i++) {
    switch (compare(player1.deck[i], player2.deck[i])) {
      case '>':
        player1.points++;
        break;
      case '<':
        player2.points++;
        break;
    }
    console.log(player1.deck[i] + player2.deck[i] + compare(player1.deck[i], player2.deck[i]));
  }
  if (player1.points === player2.points) {
    console.log(player1.name + ' and ' + player2.name + ' tie ' + player1.points + ' to ' + player2.points);
  } else if (player1.points > player2.points) {
    console.log(player1.name + ' wins ' + player1.points + ' to ' + player2.points);
  } else {
    console.log(player2.name + ' wins ' + player2.points + ' to ' + player1.points);
  }
}

alice.deck = ['A', '7', '8'];
bob.deck = ['K', '5', '9'];

winner(alice, bob);
