

  def self.create_phone_number(nums)
    number = ""
    type = nil
    case nums.length
    when 10
      type = :areacode
    end

    if type == :areacode
      number = "("
    end
    nums.length.times do |index|
      if nums[index].to_i > 9
        return "Error: digits only, please"
      end
      if nums[index].to_i < 0
        return "Error: no negatives, please"
      end
      case nums[index]
      when :'*'
        number += '*'
      when :'#'
        number += '#'
      else
        if nums[index].to_s.length != 1
          return "Error: digit too long."
        end
        number += nums[index].to_s
      end
      case index
      when 2
        number += ") "
      when 5
        number += "-"
      end
    end
    number
  end

  def valid_phone_number(numstring)
    if numstring.length != 14
      return false
    else
      unless (numstring[0] + numstring[4,2] + numstring[9] == '() -')
        return false
      end
      digits = numstring.delete('() -')
      10.times do |i|
        unless digits[i] == '0'
          if digits[i].to_i <= 0
            return false
          end
        end
      end
    end
    return true
  end



puts "create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])"
puts create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])

puts
puts 'valid_phone_number("(123) 456-7890") # => returns true'
puts 'valid_phone_number("(1111)555 2345") # => returns false'
puts 'valid_phone_number("(098) 123 4567") # => returns false'

puts valid_phone_number("(123) 456-7890") # => returns true
puts valid_phone_number("(1111)555 2345") # => returns false
puts valid_phone_number("(098) 123 4567") # => returns false
