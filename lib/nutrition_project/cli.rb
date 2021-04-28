class NutritionProject::CLI
  

    def program 
        interaction
        first_menu
        
    end
    
   @@data = []
    def interaction
        clear
        puts "Hi welcome to food data!"
        puts "Enter the ingredient you would like info on:"
        @ingredient = gets.chomp.downcase
        @@data << @ingredient
        API.get_data
        @item = Items.create(@ingredient)
        puts "Please wait while I gather the data"
        
        
        
        
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
            puts ["","The serving size is:"]
            puts ["#{@item.serving}", "", ""]
            second_menu
        elsif first_user_choice == "2"
            puts ["","Here is a link to a picture:"]
            link = @item.photo.fetch("thumb")
           
            puts ["#{link}", "", ""]
            second_menu
        elsif first_user_choice == "3"
            puts "Please wait loading..."
           nutrients= Nutrients.create
            puts "Here is the nutritional data for #{@ingredient}"
            
            nutrients.nutrients.each{|nut| puts nut}
            second_menu
        elsif first_user_choice == "exit"
        elsif first_user_choice == "4"
          
               Calculator.new
               second_menu
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
            second_menu
        end
    end

    def self.data
        @@data
    end

    def clear
        @@data.clear
      
    end

    
 end