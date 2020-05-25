class Song 
   attr_accessor :name
   attr_reader :artist, :genre 
   @@all = []
   
   def initialize(name, artist = nil, genre = nil)
     @name = name
     if artist != nil 
     self.artist = artist 
   end 
     if genre != nil
       self.genre = genre 
   end
 end 
 
   def artist=(artist)
     @artist = artist
     artist.add_song(self)
   end 
   
   def genre= (genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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
     song = self.new(name)
     song.save
     song
   end 
   
   def self.find_by_name(name)
     @@all.detect{|song| song.name == name}
   end 
   
   def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create(name)
   end 
   
   def self.new_from_filename(filename)
    split_file = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(split_file[0])
    genre = Genre.find_or_create_by_name(split_file[2])
    self.new(split_file[1], artist, genre)
  end
     
     def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end