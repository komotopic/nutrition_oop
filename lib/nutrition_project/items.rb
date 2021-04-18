class Items

    attr_accessor :name, :serving, :photo, :nutrients
    @@all = []
    def initialize(name)
        @serving = api.fetch("serving_qty")
        @photo = api.fetch("photo")
        @nutrients = protein
        
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

    def protein
      nutrient_array.map do |hash|
        if hash.fetch("attr_id")== 203
            return hash.fetch("value")
        end
    
    
    end
    
end

   
    
    
end