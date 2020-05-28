require_relative './concerns/findable.rb'

class Genre
    extend Concerns::Findable
    attr_accessor :name, :artist

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
        genre = self.new(name)
        genre.save
        genre
    end

    def songs
        @songs
    end

    def artists
        @songs.collect{|song| song.artist}.uniq
    end
end
