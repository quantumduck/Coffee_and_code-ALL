def mk_array(n, m = 12, s = 1)
  array = [s]
  (n-1).times { |i| array <<  array[i] * m }
  array
end

def screw_up(array)
  array = array.reverse
  array = array.map { |s| s.reverse }
end

def to_hash(array)
  hash = {}
  array.each { |a| hash.store(a[0], a[1])}
  hash
end

puts mk_array(8).to_s

# %w(first, second, third, fourth, fifth, sixth)

puts screw_up(["first", "second", "third", "fourth", "fifth", "sixth"]).to_s

movies = [['Alfonso Cuaron', 'Gravity'], ['Spike Jonze', 'Her'], ['Martin Scorsese', 'The Wolf of Wall Street']]

puts to_hash(movies).to_s
