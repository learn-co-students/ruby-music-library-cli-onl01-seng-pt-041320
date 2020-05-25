class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  
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
  
  def add_song(song)
      if song.artist != self
          song.artist = self
        end 
      if !@songs.include?(song)
          @songs << song 
        end 
  end 
      
    def genres 
      @genres = []
		self.songs.each do |song|
			@genres << (song.genre)
		end
		@genres.uniq
	end 
  
end 