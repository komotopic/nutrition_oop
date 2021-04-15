class NutritionProject::CLI
  

    def program 
        interaction
        first_menu
        
    end
    
   @@data = []
    def interaction
        puts "Hi welcome to food data!"
        puts "Enter the ingredient you would like info on:"
        @ingredient = gets.chomp.downcase
        @@data << @ingredient
        Items.create(@ingredient)
        
    end
     
   
    def first_menu
            
        puts "What information for #{@ingredient} would you like?"
        puts "1. Serving size"
        puts "2. A picture"
        puts "3. Nutritional data"
        puts "4. Nutrient calculator"
        puts "or type exit"
        first_user_choice = gets.chomp
        if first_user_choice == "1"
            puts "The serving size is:"
            second_menu
        elsif first_user_choice == "2"
            puts "Here is a link to a picture:"
            second_menu
        elsif first_user_choice == "3"
            puts "Here is the nutritional data for #{@ingredient}"
            second_menu
        elsif first_user_choice == "exit"
        elsif first_user_choice == "4"
            calculator
        else
            puts "I don't understand try entering 1, 2, 3, or exit"
            first_menu
        
        end
       

    end

    def second_menu
        puts "If you would like more information for #{@ingredient} enter info"
        puts "If you would like to try another ingredient enter new"
        puts "or type exit"
        second_user_choice = gets.chomp
        if second_user_choice == "info"
            first_menu
        elsif second_user_choice == "new"
            NutritionProject::CLI.new.program
        elsif second_user_choice == "exit"
        else
            puts "I don't understand try entering info, new or exit"
            
        end
    end
    

    def self.data
        @@data
    end

#     def nutrients
#         puts <<-DOC
#         Calories-208
#         Total Fat-204
#         -Saturated Fat-606
#         -Polyunsaturated-646
#         -Monounsaturated-645
#         Cholesterol-601
#         Sodium-307
#         Total Carbohydrate- 205
#         -Fiber-291
#         -Sugar-269
#         --Added Sugar-539
#         Protein-203
#         Alpha Carotene-322
#         Beta Carotene-321
#         Calcium-301
#         Copper-312
#         Iron-303
#         Potassium-306
#         Vitamin A-318
#         Vitamin B1 (thiamin)-404
#         Vitamin B2(riboflavin)-405
#         Vitamin B3 (niacin)-406
#         Vitamin B5 (panthothenic acid)-410
#         Vitamin B6 (pyridoxine)-415
#         Vitamin B9 (folate)-417
#         Vitamin B12 (cobalamin)-418
#         Vitamin C-401
#         Total Vitamin D-328
#         -Vitamin D2-325
#         -Vitamin D3-326
#         Zinc-309
#      DOC
#     end
 end