def expand(array)
  result = []
  array.each do |item|
    item[1].times do
      result << item[0]
    end
  end
  result
end

song = [["row", 3], ["your", 1], ["boat", 1]]
puts "song = " + song.to_s
puts expand(song).to_s
