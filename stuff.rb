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

def find_leap_years(start, ending)
  leap_years = (start..ending).to_a
  leap_years.delete_if { |y| (y % 4 != 0) || ((y % 100 == 0) && (y % 400 != 0)) }
  leap_years
end

puts find_leap_years(2000, 2012).to_s

def find_longest(arr)
  longest = arr.first
  arr.each do |entry|
    longest = entry if entry.length > longest.length
  end
  longest
end

def find_longest_alt(array)
  array.max { |a, b| a.length <=> b.length }
end


colours = %w(red blue green yellow chartreuse orange periwinkle tomato cobalt)

puts find_longest(colours)
