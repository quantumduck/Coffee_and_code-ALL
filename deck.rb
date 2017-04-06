class Deck

  @@def_ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King, :Ace]
  @@def_suits = [:clubs, :diamonds, :hearts, :spades]
  @@tarot_ranks = [:Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  attr_reader :game, :cards

  def self.create(ranks, suits)
    cards = combine_arrays(ranks, numbers)
    Deck.new(cards)
  end

  def self.make_cards(ranks, suits)
    cards = []
    ranks.each { |rank| suits.each { |suit| cards << Card.new(rank, suit) } }
    cards
  end

  def initialize(cards = Deck.combine_arrays(@@def_ranks, @@def_suits))
    @cards = cards
    @game = :bridge
    @all_cards = cards
  end

  def reset
    @cards = @all_cards
  end

  def set_game_type(game)
    case game
    when :bridge
      @cards.each do |card|
        card.set_points(J: 1, Q: 2, K: 3, A: 4, numbers: 0)
      end
    when :aces_high
      @cards.each do |card|
        card.set_points(J: 11, Q: 12, K: 13, A: 14, numbers: :face_value)
      end
    when :aces_low
      @cards.each do |card|
        card.set_points(J: 11, Q: 12, K: 13, A: 1, numbers: :face_value)
      end
    when :rummy
      @cards.each do |card|
        card.set_points(J: 10, Q: 10, K: 10, A: 1, numbers: :face_value)
      end
    else
      @cards.each do |card|
        card.set_points(J: 0, Q: 0, K: 0, A: 0, numbers: :face_value)
      end
    end

    @game = game
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

  def sort(how)

end

class Card < Hash

  def initialize(rank = nil, suit = nil)
    store(:rank, rank)
    store(:suit, suit)
    store(:points, 0)
  end

  def full_name
    "#{self[:rank].to_s.capitalize} of #{self[:suit].to_s.capitalize}"
  end

  def name(abbrev = 1)
    if abbrev.to_i >= 1
      return self[:rank].to_s[0, abbrev].upcase + self[:suit].to_s[0, abbrev].downcase
    else
      return self[:rank].to_s.upcase + self[:suit].to_s.downcase
    end
  end

  def set_points(keys)
    case keys[:numbers]
    when :face_value
      self[:points] = self[:rank]
    else
      self[:points] = keys[:numbers]
    end
    keys.delete(:numbers)
    keys.each { |key| self[:points] = keys[key] if self[:rank] == key }
    self[:points]
end

bridgedeck = Deck.new
bridgedeck.shuffle!
bridgedeck.deal(4).each { |hand| puts hand.inspect }
