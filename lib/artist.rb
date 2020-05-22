# require 'pry'

class Artist
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
        artist = Artist.new(name)
        artist.save
        artist
    end

    def songs
        @songs
    end

    def add_song(song)
        if !song.artist
            song.artist = self
            self.songs << song            
        end
    end

    def genres
        music = Song.all.collect {|song| song.genre}
        music.uniq
    end

end