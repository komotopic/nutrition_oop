class Item

    attr_accessor :name, :serving, :photo, :serving_unit, :full_nutrients, :calories, :sugar, :saturated_fat, :cholesterol,
    :sodium, :total_fat, :total_carbohydrates
    @@all = []
    def initialize(item_data_api)
        @name = item_data_api["food_name"]
        @serving = item_data_api["serving_qty"]
        @photo = item_data_api["photo"]
        @serving_unit = item_data_api["serving_unit"]
        @full_nutrients = item_data_api["full_nutrients"]
        nutrients
        save
    end

    def self.all
        @@all
    end

    def nutrients 
        self.full_nutrients.each do |x|
            if x["attr_id"] == 208
                self.calories = x["value"]
            elsif x["attr_id"] == 269
                self.sugar = x["value"]
            elsif x["attr_id"] == 204
                self.total_fat = x["value"]
            elsif x["attr_id"] == 606
                self.saturated_fat = x["value"]
            elsif x["attr_id"] == 601
                self.cholesterol = x["value"]
            elsif x["attr_id"] == 307
                self.sodium = x["value"]
            elsif x["attr_id"] == 205
                self.total_carbohydrates = x["value"]
            
            end
        end
    end

    def save
        if @@all.detect { |item| item.name == self.name}
       
       else
            @@all << self
       end
    end

    def self.find_item(ingredient, index)
        list = self.list(ingredient)
        if index.to_i.between?(1, list.length)
        list[index.to_i - 1]
        end
    end

    def self.list(ingredient) 
        new_array = []
        self.all.select do |item|
          if  item.name.include?(ingredient)
            new_array << item
          end
        end
        new_array
    end
end