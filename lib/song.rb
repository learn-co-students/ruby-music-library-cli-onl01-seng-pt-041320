class Song 
  attr_accessor :name
  
  @@all = []
  def initialize(name, artist = nil, genre = nil)
      @name = name 
      if artist != nil
      self.artist= artist
		end
		  if genre != nil
      self.genre= genre
		end
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
  
  def artist
      @artist
  end 
  
  def artist=(artist)
      @artist = artist
      artist.add_song(self)
  end 
  
  def genre=(genre)
		  @genre = genre
		  genre.add_song(self)
	end
	
	def genre 
	    @genre 
	end 
  
  def self.find_by_name(search)
      @@all.find{|artist| artist.name == search}
  end 
  
  def self.find_or_create_by_name(search)
      self.find_by_name(search) ? (search = self.find_by_name(search)) : self.create(search)
  end 

  def self.new_from_filename(filename)
      artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
		genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
		song = new(filename.split(" - ")[1], artist, genre)
  end 
  
  def self.create_from_filename(filename)
		  creation = Song.new_from_filename(filename) 
		  creation.save 
  end

  
end 