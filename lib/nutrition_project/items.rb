class Items

    attr_accessor :name, :serving, :photo, :serving_unit
    @@all = []
    @@conversion_array = []
    def initialize(name)
        clear
        
        @name = name
        @serving = api.fetch("serving_qty")
        @photo = api.fetch("photo")
        @serving_unit = api.fetch("serving_unit")
        calc_insert
        save
    end

    def self.all
        @@all
    end

    def self.conversion_array
        @@conversion_array
    end

    def save
        @@all << self
    end

    def clear
        @@all.clear
    end

    def self.create(name)
        Items.new(name)
    end

     def api
       API.get_data.dig(0)
        
     end

     def calc_insert
        @@conversion_array << @serving.to_i
        @@conversion_array << @serving_unit
     end
     
     
        
        
        
    

   
  
    

   
        
end