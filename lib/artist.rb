require_relative './concerns/findable.rb'

class Artist
    extend Concerns::Findable
    attr_accessor :name, :genre

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def save
        self.class.all << self unless self.class.all.include?(self)
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(name)
        artist = self.new(name)
        artist.save
        artist
    end

    def add_song(song)
        if song.artist != self
          song.artist = self
        end
         @songs << song unless @songs.include?(song)
    end

    def songs
        @songs
    end

    def genres
        songs.collect{|song| song.genre}.uniq    
    end

end
