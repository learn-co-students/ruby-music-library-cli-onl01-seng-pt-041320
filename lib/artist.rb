require 'pry'

class Artist
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
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
 
  def songs
    @songs
  end
  
  def add_song(song)
    @songs << song if @songs.none?(song)
    song.artist = self if song.artist == nil  
  end
  
  def genres 
    self.songs.collect{|song| song.genre}.uniq
  end
end