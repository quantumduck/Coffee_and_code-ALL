class Deck

  @@def_ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King, :Ace]
  @@def_suits = [:clubs, :diamonds, :hearts, :spades]
  @@tarot_minor_ranks = [:Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Knight, :Queen, :King]
  @@tarot_minor_suits = [:rods, :coins, :cups, :swords]
  @@tarot_major_ranks = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21]

  attr_reader :game :all_cards
  attr_accessor :cards

  def self.create(ranks, suits)
    cards = combine_arrays(ranks, numbers)
    Deck.new(cards)
  end

  def self.create_tarot
    newtarot = create(@@tarot_minor_ranks, @@tarot_minor_suits)
    22.times { |n| newtarot.cards << Card.new(n, :majors) }
    newtarot
  end

  def self.make_cards(ranks, suits)
    cards = []
    ranks.each { |rank| suits.each { |suit| cards << Card.new(rank, suit) } }
    cards
  end

  def initialize(cards = Deck.make_cards(@@def_ranks, @@def_suits))
    @cards = cards
    @game = :none
    @all_cards = cards
    @card_sets = []
  end

  def reset
    @cards = @all_cards
    @card_sets = []
  end

  def set_game_type(game)
    case game
    when :bridge
      @cards.each do |card|
        card.set_points(J: 1, Q: 2, K: 3, A: 4, numbers: 0)
        card.set_game_rank(J: 11, Q: 12, K: 13, A: 14, numbers: :face_value)
      end
    when :aces_high
      @cards.each do |card|
        card.set_points(J: 0, Q: 0, K: 0, A: 0, numbers: :face_value)
        card.set_game_rank(J: 11, Q: 12, K: 13, A: 14, numbers: :face_value)
      end
    when :aces_low
      @cards.each do |card|
        card.set_points(J: 0, Q: 0, K: 0, A: 0, numbers: :face_value)
        card.set_game_rank(J: 11, Q: 12, K: 13, A: 1, numbers: :face_value)
      end
    when :rummy
      @cards.each do |card|
        card.set_points(J: 10, Q: 10, K: 10, A: 1, numbers: :face_value)
        card.set_game_rank(J: 11, Q: 12, K: 13, A: 1, numbers: :face_value)
      end
    else
      @cards.each do |card|
        card.set_points(J: 0, Q: 0, K: 0, A: 0, numbers: :face_value)
        card.set_game_rank(J: 11, Q: 12, K: 13, A: 1, numbers: :face_value)
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

  def deal_hands(num_hands, size = 0)
    hands = []
    num_hands.times { hands << Hand.new(self) }
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

  def add_set(card_set = CardSet.new(self))
    @card_sets << card_set
  end

  def rm_set(card_set)
    if @card_sets.include?(card_set)
      card_set.each { |card| @cards << card }
      @card_sets.delete(self)
    end
  end

  def deal(n = 1)
    cards_dealt = []
    n.times { cards_dealt << @cards.pop }
    cards_dealt
  end

end

class CardSet < Deck

  def self.create(deck)
    new(deck)
  end

  def initialize(deck)
    @cards = []
    @parent_deck = deck
    deck.add_set(self)
  end

  def add(n = 1)
    n.times { @cards << @parent_deck.deal.first }
  end

  def remove(card)
    if @cards.include?(card)
    end

  end

  def max_card
    max_card = @cards.first
    @cards.each { |card| max_card = card if card[:game_rank] > max_card[:game_rank] }
    max_card
  end

end

class Hand < CardSet

  def pick_up

  end

  def play(card, card_set)
    card_set.add << @cards.pop
  end

  def sort!

  end

  def list
    contents = []
    @cards.each { |card| contents << card.full_name }
    contents
  end

end

class Card < Hash

  def initialize(rank = nil, suit = nil)
    store(:rank, rank)
    store(:suit, suit)
    store(:points, 0)
    store(:game_rank, rank.to_i)
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

  def set_game_rank(keys)
    case keys[:numbers]
    when :face_value
      self[:game_rank] = self[:rank]
    else
      self[:game_rank] = keys[:numbers]
    end
    keys.delete(:numbers)
    keys.each { |key| self[:game_rank] = keys[key] if self[:game_rank] == key }
    self[:game_rank]
  end

end

bridgedeck = Deck.new
bridgedeck.shuffle!
bridgedeck.deal(4).each { |hand| puts hand.list.to_s }
