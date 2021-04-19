class Items

    attr_accessor :name, :serving, :photo
    @@all = []
    def initialize(name)
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

   
  
    

   
        
end