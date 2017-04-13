def array_to_hash(array)
  hash = {}
  array.each do |entry|
    if hash.include?(entry.first)
      hash[entry.first] += entry.last
    else
      hash[entry.first] = entry.last
    end
  end
  hash
end

animals = [['dogs', 4], ['cats', 3], ['dogs', 7]]

puts array_to_hash(animals)

def find_leap_years(start, end)

end
