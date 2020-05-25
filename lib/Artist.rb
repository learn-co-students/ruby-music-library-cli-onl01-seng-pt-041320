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
    @@all.clear
  end 
  
  def save
    @@all << self 
  end 
  
  def self.create(artist)
    artist = self.new(artist)
    artist.save 
    artist 
  end 
  
  def songs
    @songs 
  end 
  
  def add_song(song)
    if song.artist != self 
      song.artist = self 
    end 
    if !@songs.include?(song)
      @songs << song 
    end 
      
  end 
  def genres 
    songs.map(&:genre).uniq
  end
  
end 