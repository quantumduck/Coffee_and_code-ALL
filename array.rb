def mk_array(n)
  array = [1]
  (n-1).times { |i| array <<  array[i] * 12 }
  array
end

puts mk_array(8)
