class Luhn
    @@doubled_arr = [] of Int32
    def self.valid?(num)
        num = num.gsub(/\s/, "") #white spaces are stripped
        (num.to_s.chars.size > 1) && (num.to_s.chars.size % 2 == 0) && (num.class == "string" || "number") ? num : false #to be valid, number must have more than 1 digit, have an even number of digits, and be of number or string class
    end 

    def self.double_second_digit(num)
       
        num_arr = num.gsub(/\s/, "").to_s.chars.reverse #removes white spaces and creates a reversed array of string characters of each digit
        num_arr = num_arr.map {|x| x.to_i } #mapped to an array with items of the Number data type
        num_arr.each_with_index{|n, i| i%2 == 1 ? @@doubled_arr << n*2 : @@doubled_arr << n} #every second number is doubled and inserted into the doubled_arr
       
        @@doubled_arr = @@doubled_arr.reverse #doubled_arr is reversed back to the original order
    end

    def self.check_sum(num)
        
        @@doubled_arr.sum % 10 == 0 ? true : false
    end

end











# # Luhn.sum_all_digits("1234 5678")
# Luhn.double_second_digit("1234 5678")
# Luhn.check_sum("1234 5678")

