class Luhn
    @@doubled_arr = [] of Int32
    def self.valid?(num) #Main Method - checks input format
        num_gs = num.gsub(/\s/, "") #replaces empty splaces with no space
        #to be valid, number must have more than 1 digit, have an even number of digits, odd number of spaces or no spaces at all, and be of string class, only contain digits or spaces, and pass the validity check method
        if (num.count("a-zA-Z") == 0) && (/^([[:digit:]]|\]|[[:space:]]|\[|\,)*$/.match(num) != nil ) 
            (num_gs.to_s.size > 1) && (num_gs.size % 2 == 0) && (num.count(" ")%2 == 1 || 0 ) && (num.class == String) && (num_check(num)) ? true : false 
        else 
            false 
        end
    end 
    
    def self.num_check(num) #Method to check validity of number combos
        num_arr = num.gsub(/\s/, "").to_s.chars.reverse #removes white spaces and creates a reversed array of string characters of each digit
        num_arr = num_arr.map {|x| x.to_i } #mapped to an array with items of the Number data type       
        num_arr.each_with_index{|n, i| i%2 == 1 ? @@doubled_arr << n*2 : @@doubled_arr << n} #every second number is doubled and inserted into the doubled_arr
        @@doubled_arr = @@doubled_arr.map {|x| x > 9 ? x-9 : x } 
        @@doubled_arr = @@doubled_arr.reverse
        @@doubled_arr.sum % 10 == 0 ? true : false
    end
end
