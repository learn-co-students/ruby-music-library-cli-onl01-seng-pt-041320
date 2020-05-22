class Genre
    attr_accessor :name
    extend Concerns::Findable
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        genre = Genre.new(name)
        genre.save
        genre
    end

    def songs
        @songs
    end

    def artists
        music = Song.all.collect {|song| song.artist}
        music.uniq
    end

end
