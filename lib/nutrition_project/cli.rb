class NutritionProject::CLI
  

    def program 
        intro
        data_entry
        
    end
    
    def intro
        puts "Hi welcome to the nutrition data calculator!"
        puts "What is your name?"
        name = gets
        puts "Where are you from?"
        location = gets
    end
     
    @@data = []
    def data_entry
        puts "Enter the ingredient"
        ingredient = gets.chomp
        @@data << ingredient
        # binding.pry
        puts "Enter quanity (use each for a single piece of foor ex. 1 each)"
        quanity = gets.chomp
        @@data << quanity
        binding.pry
    end

    def self.data
        @@data
    end

    def nutrients
        puts <<-DOC
        Calories-208
        Total Fat-204
        -Saturated Fat-606
        -Polyunsaturated-646
        -Monounsaturated-645
        Cholesterol-601
        Sodium-307
        Total Carbohydrate- 205
        -Fiber-291
        -Sugar-269
        --Added Sugar-539
        Protein-203
        Alpha Carotene-322
        Beta Carotene-321
        Calcium-301
        Copper-312
        Iron-303
        Potassium-306
        Vitamin A-318
        Vitamin B1 (thiamin)-404
        Vitamin B2(riboflavin)-405
        Vitamin B3 (niacin)-406
        Vitamin B5 (panthothenic acid)-410
        Vitamin B6 (pyridoxine)-415
        Vitamin B9 (folate)-417
        Vitamin B12 (cobalamin)-418
        Vitamin C-401
        Total Vitamin D-328
        -Vitamin D2-325
        -Vitamin D3-326
        Zinc-309
     DOC
    end
end