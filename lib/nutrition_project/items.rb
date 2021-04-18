class Items

    attr_accessor :name, :serving, :photo
    @@all = []
    def initialize(name)
        @nutrients = ()
        @serving = api.fetch("serving_qty")
        @photo = api.fetch("photo")
        
        
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.create(name)
        Items.new(name)
    end

    def api
       API.get_data.dig(0)
        
    end

    def nutrient_array
        api.fetch("full_nutrients")
    end

    def add_nutrients(key,value)
        @nutrients[:key] = value
    end

    def nutrients
        @nutrients
    end
  
    def nutrient_find
        nutrient_hash = {:calories=>208,
            :total_fat=>204,
            :saturated_fat=>606, 
            :polyunsaturated_fat =>646, 
            ,:monounsaturated =>645
            ,:cholesterol =>601
            ,:sodium =>307
            ,:total carbohydrates=>205
            ,:fiber =>291
            ,:sugar =>269
            ,:added sugar =>539
            ,:protein =>203
            ,:alpha carotene =>322
            ,:beta carotene =>321
            ,:calcium =>301
            ,:copper =>312
            ,:iron =>303
            ,:potassium =>306
            ,:vitamin a =>318
            ,:vitamin b1 (thiamin) =>404
            ,:vitamin b2(riboflavin) =>405
            ,:vitamin b3 (niacin) =>406
            ,:vitamin b5 (panthothenic acid) =>410
            ,:vitamin b6 (pyridoxine) =>415
            ,:vitamin b9 (folate) =>417
            ,:vitamin b12 (cobalamin)=>418 
            ,:vitamin c =>401
            ,:total vitamin d=>328 
            ,:vitamin d2 =>325
            ,:vitamin d3 =>326
            ,:zinc =>309}
    
            nutrient_hash.map do |key, value|
                nutrient_array.map do |hash|
                    if hash.fetch("attr_id") == value
                        @nutrients << "#{key} = "
                    end
                end
            end
    end
    def protein
      nutrient_array.map do |hash|
        if hash.fetch("attr_id")== 203
            @nutrient_hash[:protein] = hash.fetch("value")
        end
    end

    def calories

    end

    def total_fat

    end

    def saturated_fat

    end

    
    
end

        #         Calories
        #         Total Fat
        #         Saturated Fat
        #         Polyunsaturated
        #         Monounsaturated
        #         Cholesterol
        #         Sodium
        #         Total Carbohydrate5
        #         Fiber
        #         Sugar
        #         Added Sugar
        #         Protein
        #         Alpha Carotene
        #         Beta Carotene
        #         Calcium
        #         Copper
        #         Iron
        #         Potassium
        #         Vitamin A
        #         Vitamin B1 (thiamin)
        #         Vitamin B2(riboflavin)
        #         Vitamin B3 (niacin)
        #         Vitamin B5 (panthothenic acid)
        #         Vitamin B6 (pyridoxine)
        #         Vitamin B9 (folate)
        #         Vitamin B12 (cobalamin)
        #         Vitamin C
        #         Total Vitamin D
        #         Vitamin D2
        #         Vitamin D3
        #         Zinc
        #      DOC
        #     end
   
    
    
end