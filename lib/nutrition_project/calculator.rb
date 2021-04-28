require_relative './conversion.rb'
class Calculator
    attr_accessor :user_amount, :api_amount, :unit_to_convert_nutrients
    extend Conversion
    def initialize
        calculator
        converted_data_and_print
    end

    def calculator
        puts "Use any imperial measurement or each in the case of a whole fruit or vegetable(e.g 1 cup, 3 each)"
        puts "Please enter amount of #{@ingredient}:"
        amount = gets.chomp.downcase.split(" ")
         @user_amount = Conversion.unit_conversion(amount).to_f
         check_usability
         @api_amount = Conversion.unit_conversion(Items.conversion_array).to_f
         @unit_to_convert_nutrients = @user_amount / @api_amount
      
    end

    def check_usability
        if @user_amount == 0
            puts "Please reenter measurement in the format stated"
            calculator
        end
    end

    def converted_data_and_print
        puts "Please wait calculating..."
        nutrients= Nutrients.create
       
        puts "Here is the converted nutritional data for #{Items.name}"
        calc_nut = []
        calc_nut << nutrients.nutrients.map do|nut|
             spli_array = nut.split(" ")
             spli_array[2] = spli_array[2].to_f * @unit_to_convert_nutrients
             spli_array.join(" ")
             end
             
        calc_nut.each{|nut| puts nut}
    end
end

    
