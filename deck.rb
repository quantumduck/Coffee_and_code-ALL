class Deck

  @@def_ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
  @@def_suits = [:clubs, :diamonds, :hearts, :spades]

  def self.create(ranks, suits)
    cards = combine_arrays(ranks, numbers)
    Deck.new(cards)
  end

  def self.combine_arrays(array1, array2)
    combined = []
    array1.each { |a1| array2.each { |a2| combined << [a1, a2] } }
    combined
  end

  def initialize(cards = Deck.combine_arrays(@@def_ranks, @@def_suits))
    @cards = cards
  end

  def shuffle!
    (@cards.length - 1).times do |n|
      i = rand(@cards.length - n)
      @cards << @cards[i]
      @cards.delete_at(i)
    end
  end

  def deal(num_hands, size = 0)
    hands = []
    num_hands.times { hands << Hand.new }
    while @cards.length >= num_hands
      hands.each { |hand| hand.add(@cards.pop) }
      if size > 0
        if hands[0].length == size
          return hands
        end
      end
    end
    return hands
  end
end

class Hand < Deck

  def self.create
    Hand.new
  end

  def initialize
    @cards = []
  end

  def add(card)
    @cards << card
  end

  def play(card)
    @cards.pop
  end

end

bridgedeck = Deck.new
bridgedeck.shuffle!
bridgedeck.deal(4).each { |hand| puts hand.inspect }
