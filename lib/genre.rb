class Genre
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
  
  def save
      @@all << self 
  end 
  
  def self.destroy_all
      self.all.clear
  end 
  
  def self.create(song)
       song = self.new(song)
       song.save
       song
  end 
  
  def songs 
      @songs
  end 
  
   def add_song(song)
      if song.genre != self
          song.genre = self
        end 
      if !@songs.include?(song)
          @songs << song 
        end 
  end 
  
  def artists 
      @artists = []
		self.songs.each do |song|
			@artists << (song.artist)
		end
		@artists.uniq
	end 
end 