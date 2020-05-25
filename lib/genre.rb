class Genre
    extend Concerns::Findable
    attr_accessor :name

    @@all = [] 
    def initialize(name)
        @name = name 
        @songs = []
    end 

    def self.all
        @@all 
    end

    def self.destroy_all
        @@all.clear 
    end

    def save
        @@all << self
    end 

    def self.create(name)
        song = self.new(name)
        song.save 
        song
    end

    def songs 
        @songs
    end 

    def artists
        artists_collect = songs.collect{|song| song.artist}
        artists_collect.uniq
    end

end 