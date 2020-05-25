require_relative '../lib/concerns/Findable.rb'

class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
      save
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
      self.new(name)
    end

    def add_song(song)

      if song.artist == nil
        song.artist = self
      end

      if !@songs.include?(song)
        @songs << song
      end

#      newsong = Song.new(song, self)
#      @songs << newsong
    end

    def genres
      genres = []
      Song.all.each do |song|
        if song.artist == self && !genres.include?(song.genre)
          genres << song.genre
        end
      end
      genres
    end


end
