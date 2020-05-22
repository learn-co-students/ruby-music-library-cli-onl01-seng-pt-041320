class Song
  attr_accessor :name, :artist, :genre
  
  
  @@all = []
  def initialize(name, artist = nil, genre = nil)
	  @name = name
	  self.artist=artist if artist
	  self.genre=genre if genre
  end

  def save
	  @@all << self
  end

  def artist=(artist)
		@artist = artist
	  artist.add_song(self)
  end
    
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
    end
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
    
end