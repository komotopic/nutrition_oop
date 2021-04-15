class Items

    attr_accessor :name, :serving, :photo, :nutrients
    @@all = []
    def initialize
        @name = name
        @serving = serving
        @photo = photo
        @nutrients = nutrients
        save
    end

    def self.save
        @@all << self
    end

    def self.create(name)
        item = Items.new(name)
    end
end