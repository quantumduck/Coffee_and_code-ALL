def prime(max_val)
  indexes = (max_val - 1).times.to_a
  primes = indexes.map { |i| i + 2 }
  index = 0
  while index < primes.length
    primes.delete_if { |p| (p > primes[index]) && (p % primes[index] == 0) }
    index += 1
  end
  primes
end

def is_prime?(n)
  if n < 2
    false
  elsif n == 2
    true
  elsif n % 2 == 0
    false
  elsif
    factor = 3
    while factor < (n/2)
      if n % factor == 0
        return false
      end
      factor += 2
    end
    true
  end
end

puts prime(100).to_s

def mult_table(n)
  mult_table = []
  n.times do |row|
    mult_table << []
    n.times { |col| mult_table[row] << (row + 1) * (col + 1) }
  end
  mult_table
end

puts
puts mult_table(6).to_s


def get_squares(array)
  array = array.to_a
  max_num = array.max
  n = 1
  all_squares = []
  while n**2 <= max_num
    all_squares << n**2
    n += 1
  end
  all_squares.delete_if { |sq| !array.include?(sq) }
end
puts
puts get_squares(1..16).to_s # => [1, 4, 9, 16]
puts get_squares(1..100).to_s # => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
puts get_squares([4, 1, 16, 1]).to_s
