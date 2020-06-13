# frozen_string_literal: true

class Artist
  attr_accessor :name
  extend Concerns::Findable # add extend to any class to store all the codes from different files into a module. passing all the method and instances from all classes to a module so they're all available thrught the whole cli.

  @@all = []

  def initialize(name) # initialized the name instance
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear # remove all instances from array.
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def add_song(song)
    unless song.artist
      song.artist = self
    end #=> ! negation if the instance is not == to the instance itself then unique array made with the new instance.
    self.song.map(&:genre).uniq # call the class itself on the song instance and map it out by genre and return a unique array.
  end
end
