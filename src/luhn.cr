class Luhn
  def self.valid?(number)          # Main Method - checks input format
    number_gs = number.gsub(/\s/, "") # replaces empty splaces with no space
    # to be valid, number must have more than 1 digit, have an even number of digits, odd number of spaces or no spaces at all, and be of string class, only contain digits or spaces, and pass the validity check method
    if number.count("a-zA-Z:!@#$%^&&*()_+=-") == 0   #replaced Regex pattern with the count method
      (number_gs.to_s.size > 1) && (number_gs.size % 2 == 0) && (number.count(" ") % 2 == 1 || 0) && (number_check(number)) 
    else
      false
    end
  end

  def self.number_check(number)    # Method to check validity of number combos
    doubled_arr = [] of Int32                                                                 
    number_arr = number.gsub(/\s/, "").to_s.chars.reverse.map { |x| x.to_i }    # removes white spaces and creates a reversed array of string characters of each digit and mapped to an array with items of the Number data type
    number_arr.each_with_index { |n, i| i % 2 == 1 ? doubled_arr << n*2 : doubled_arr << n } # every second number is doubled and inserted into the doubled_arr
    doubled_arr1 = doubled_arr.map { |x| x > 9 ? x - 9 : x }.reverse
    doubled_arr1.sum % 10 == 0 
  end
end