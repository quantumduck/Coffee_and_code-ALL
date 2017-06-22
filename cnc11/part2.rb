def elapsed_seconds(start_time, end_time)
  (end_time - start_time).to_i
end

puts elapsed_seconds(Time.now, Time.now + 3600)

def remove_odd_hashes(array, key1, key2)
  array.delete_if do |h|
    !h[key1] || !h[key2] || ((h[key1] + h[key2]) % 2 == 1)
  end
end





puts remove_odd_hashes(
  [ {a: 5, b: 5},
    {a: 3, b: 4},
    {a: 2, b: 0},
    {a: 2, b: 1}],
  :a, :b)
