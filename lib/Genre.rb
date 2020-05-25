require 'pry'

class Genre

    @@all =[]

    attr_accessor :name, :songs
    extend Concerns::Findable

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all
    end

    def self.create(genre)
        created_genre = Genre.new(genre)
        created_genre.save
        created_genre
    end

    def songs
        @songs
    end

    def add_song(song) #assigns the current artist to the song's 'artist' property (song belongs to artist)
        if song.genre != self
            song.genre = self
        end
    end

    def artists #returns a collection of artists for all of the genre's songs (genre has many artists through songs)
        artists = Song.all.collect {|song| song.artist}
        artists.uniq
    end
end

