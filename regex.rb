def find_png(file_name_list)
  matches = file_name_list
  matches.delete_if { |file| !file.match(/\.png$/) }
  matches
end

puts "find_png(['file1.jpg', 'file2.png']).to_s"
puts find_png(["file1.jpg", "file2.png"]).to_s

def find_three_letters(list)
  matches = list
  matches.delete_if { |string| !string.match(/^.{3}$/) }
  matches
end

puts "find_three_letters(['cat', 'dog', 'rhinoceros']).to_s"
puts find_three_letters(['cat', 'dog', 'rhinoceros']).to_s

def find_non_intial_bs(list)
  matches = list
  matches.delete_if { |string| string.match(/^B/) }
  matches
end

puts "find_non_intial_bs(['Ben', 'Edwin', 'Lauren']).to_s"
puts find_non_intial_bs(['Ben', 'Edwin', 'Lauren']).to_s

def find_no_bs_at_all(list)
  matches = list
  matches.delete_if { |string| string.match(/[Bb]+/) }
  matches
end

puts "find_non_intial_bs(['Ben', 'Edwin', 'Lauren', 'Ruby']).to_s"
puts find_non_intial_bs(['Ben', 'Edwin', 'Lauren', 'Ruby']).to_s
