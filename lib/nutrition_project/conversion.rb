module Conversion
    def self.unit_conversion(amount_array)
        
        amount_to_oz = 0
        if amount_array[1] == "tsp"
            amount_to_oz = 0.166
        elsif amount_array[1] == "tbsp"
            amount_to_oz = 0.5
        elsif amount_array[1] == "oz"
            amount_to_oz = 1
        elsif amount_array[1] == "cup"
            amount_to_oz = 8 
        elsif amount_array[1] == "pint"
            amount_to_oz = 16
        elsif amount_array[1] == "quart"
            amount_to_oz = 32
        elsif amount_array[1] == "gallon"
            amount_to_oz = 128
        else
            amount_to_oz = 1
            
        end
        converted_amount = amount_to_oz * amount_array[0].to_i
        converted_amount
    end

   
end