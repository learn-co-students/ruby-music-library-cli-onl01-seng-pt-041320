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
        genre = self.new(name)
        genre.name = name
        @@all << genre
        genre
    end

    #Associations

    def songs
        @songs
    end

    def add_song(song)
        song.genre = self if song.genre == nil
        self.songs << song unless @songs.include?(song)
    end

    def artists
        self.songs.map{|song| song.artist}.uniq
    end

end