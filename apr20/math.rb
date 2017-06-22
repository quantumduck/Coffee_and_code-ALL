def prime(max_val)
  indexes = (max_val - 1).times.to_a # array from 0 to max_val - 2
  primes = indexes.map { |i| i + 2 } # array from 2 to max_val
  index = 0
  while index < primes.length
    # we have to use while because prime.length changes during iteration.
    primes.delete_if { |p| (p > primes[index]) && (p % primes[index] == 0) }
    # delete all numbers greater than the current number if they are multiples.
    index += 1
  end
  primes # ensure you return the array.
end

def is_prime?(n)
  if n < 2
    false # no primes < 2
  elsif n == 2
    true # 2 is a prime
  elsif n % 2 == 0
    false # no even primes > 2
  elsif
    factor = 3 # lowest possible odd prime factor
    while factor < (n/2) # only check factors up to n/2 or (n**0.5 if you like)
      if n % factor == 0
        return false # numbers with prime factors are not prime
      end
      factor += 2 # go to the next prime factor
    end
    true # if the while look reaches the end, no prime factors were found.
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
