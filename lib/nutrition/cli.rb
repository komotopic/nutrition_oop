class NutritionProject::CLI
    

    def intro
        puts "Hi welcome to the food search engine!"
        recieve_ingredient
    end

    def recieve_ingredient
        puts "Enter the ingredient you would like to search for, or exit to leave:"
        ingredient = gets.chomp.downcase
        if ingredient == "exit"
            goodbye
        end
        API.get_data(ingredient)
        if Item.all.length == 0
            puts "Seems there was an error finding #{ingredient} try again"
            recieve_ingredient
        else
            puts "Please allow me to gather the data"
            @ingredient = ingredient
            search_results(ingredient)
           
            
        end

    end

    def search_results(ingredient)
         puts "Please choose one result for more info:"
         Item.list(ingredient).each.with_index(1) do |item, index|
            puts "#{index}. #{item.name}"
           end
           item_selection
            

    end

    def item_selection 
        puts "Enter the number of the food you would like to see more info about or enter back to choose another ingredient."
        input = gets.chomp
       
        if input == "exit"
                goodbye
        elsif input == "back"
            get_ingredient
        elsif !!Item.find_item(@ingredient, input)
            item = Item.find_item(@ingredient, input)
            ingredient_info(item)
          
        else 
            puts "incorrect input try again:"
            sleep(1)
            item_selection
        end
        
    end

    def ingredient_info(item)
        puts ""
        puts ""
        puts "name: #{item.name}"
        puts "serving: #{item.serving} #{item.serving_unit}"
        puts "calories: #{item.calories} kcal"
        puts "total_fat: #{item.total_fat} g"
        puts "--saturated_fat: #{item.saturated_fat} g"
        puts "cholesterol: #{item.cholesterol} mg"
        puts "sodium: #{item.sodium} mg"
        puts "total_carbohydrates: #{item.total_carbohydrates} g"
        puts "sugar: #{item.sugar} g"
        puts "photo link: #{item.photo["thumb"]}" 
        puts ""
        puts ""
    end
    
    def goodbye
        puts "Thank you for using the food search engine."
    end

end
