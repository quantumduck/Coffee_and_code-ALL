def find_png(file_name_list)
  matches = []
  file_name_list.each do |file|
    matches << file if file.match(/\.png$/)
  end
  matches
end

puts "find_png(['file1.jpg', 'file2.png']).to_s"
puts find_png(["file1.jpg", "file2.png"]).to_s

def find_three_letters(list)
  matches = []
  list.each do |string|
    matches << string if string.match(/^.{3}$/)
  end
  matches
end

puts "find_three_letters(['cat', 'dog', 'rhinoceros']).to_s"
puts find_three_letters(['cat', 'dog', 'rhinoceros']).to_s

def find_non_bs(list)
  matches = []
  list.each do |string|
    matches << string if string.match(/^[^B]/)
  end
  matches
end

puts "find_non_bs(['Ben', 'Edwin', 'Lauren']).to_s"
puts find_non_bs(['Ben', 'Edwin', 'Lauren']).to_s
