def to_hash(array)
  hash = {}
  array.each { |a| hash.store(a[0], a[1])}
  hash
end

def mk_array(n, m = 12, s = 1)
  array = [s]
  (n-1).times { |i| array <<  array[i] * m }
  array
end

def prod(array)
  product = 1
  array.each { |num| product *= num  }
  product
end

puts prod(mk_array(8))
puts


movies = [['Alfonso Cuaron', 'Gravity'], ['Spike Jonze', 'Her'], ['Martin Scorsese', 'The Wolf of Wall Street']]

puts to_hash(movies).to_s
puts

numbers = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
suits = %w(spades hearts diamonds clubs)



def combine_arrays(array1, array2)
  combined = []
  array1.each { |a1| array2.each { |a2| combined << [a1, a2] } }
  combined
end
puts combine_arrays(numbers, suits).to_s
puts combine_arrays(numbers, suits).length

deck = combine_arrays(numbers, suits)

def shuffle!(deck)
  num_cards = deck.length
  (num_cards - 1).times do |n|
    i = rand(num_cards - n)
    deck << deck[i]
    deck.delete_at(i)
  end
end

shuffle!(deck)
puts deck.to_s
