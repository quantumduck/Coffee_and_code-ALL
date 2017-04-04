def mk_array(n)
  array = [1]
  (n-1).times { |i| array <<  array[i] * 12 }
  array
end

def screw_up(array)
  array = array.reverse
  array = array.map { |s| s.reverse }
end

puts mk_array(8)

puts screw_up(["first", "second", "third", "fourth", "fifth", "sixth"])
