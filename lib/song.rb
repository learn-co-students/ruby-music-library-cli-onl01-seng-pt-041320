require_relative '../lib/concerns/Findable.rb'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      if artist != nil
        self.artist = artist
      end
      if genre != nil
        self.genre = genre
      end
      #@artist = artist
      save
    end

    def self.all
      @@all
    end

    def save
      @@all << self

    end

    def self.destroy_all
      @@all.clear
    end

    def self.create(name)
      self.new(name)
    end

    def artist
      @artist
    end

    def artist=(artist)
      #name.add_song(self)
      @artist = artist
      artist.add_song(self)
    end

    def genre
      @genre
    end

    def genre=(genre)
      @genre = genre
      if !genre.songs.include?(self)
        genre.songs << self
      end
    end

#    def self.find_by_name(name)
#      song = @@all.select {|e| e == name }
#
#    end

#    def self.find_by_name(name)
#      self.all.detect { |song| song.name == name }
#    end
#
#    def self.find_or_create_by_name(name)
#
#      if self.find_by_name(name)
#        self.find_by_name(name)
#      else
#        self.create(name)
#      end
#    end

end
