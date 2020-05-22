require_relative './findable.rb'

class Artist
  extend Concerns::Findable
  
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(name)
    name = self.new(name)
  end
###
  def songs
    @songs
  end
  
  def add_song(song)
    @songs << song if @songs.none?(song)
    song.artist = self if song.artist == nil  
  end
###
  def genres
    @songs.collect {|song| song.genre}.uniq
  end
  
end