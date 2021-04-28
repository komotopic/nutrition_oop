class Nutrients
    attr_accessor :nutrients, :items

    
    def initialize
        @nutrients = []
        nutrient_find
      
    end
    
    def self.create
        Nutrients.new
    end

    def api
        API.get_data.dig(0)
         
    end

    def nutrient_array
        api.fetch("full_nutrients")
    end 

    def nutrient_find
        nutrient_hash = {:calories=>208,
            :total_fat=>204,
            :saturated_fat=>606, 
            :polyunsaturated_fat =>646, 
            :monounsaturated =>645, 
            :cholesterol =>601,
            :sodium =>307,
            :total_carbohydrates=>205,
            :fiber =>291,
            :sugar =>269,
            :added_sugar =>539,
            :protein =>203,
            :alpha_carotene =>322,
            :beta_carotene =>321,
            :calcium =>301,
            :copper =>312,
            :iron =>303,
            :potassium =>306,
            :vitamin_a =>318,
            :vitamin_b1_thiamin =>404,
            :vitamin_b2_riboflavin =>405,
            :vitamin_b3_niacin =>406,
            :vitamin_b5_panthothenic_acid =>410,
            :vitamin_b6_pyridoxine =>415,
            :vitamin_b9_folate =>417,
            :vitamin_b12_cobalamin=>418,
            :vitamin_c =>401,
            :total_vitamin_d=>328, 
            :vitamin_d2 =>325,
            :vitamin_d3 =>326,
            :zinc =>309}
    
            nutrient_hash.map do |key, value|
                nutrient_array.map do |hash|
                    if hash.fetch("attr_id") == value
                        if value == 208
                            @nutrients << "#{key} = #{hash.fetch("value")} kcal"
                        elsif [205, 606, 204, 291, 203, 269, 539, 645, 646].include?(value)
                            @nutrients << "#{key} = #{hash.fetch("value")} g"
                        elsif [301, 601, 303, 306, 307, 312, 406, 410, 405, 404, 415, 401, 309]
                            @nutrients << "#{key} = #{hash.fetch("value")} mg"
                        elsif [325, 326]
                            @nutrients << "#{key} = #{hash.fetch("value")} Âµg"
                        end
                    end
                end
            end
    end

   
        
end
