require_relative './findable.rb'

class Song
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
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
  def artist=(artist)
    if artist
      @artist = artist
      artist.add_song(self)
    end
  end
###
  def genre=(genre)
    if genre
      @genre = genre
      genre.add_song(self)
    end
  end
###
  def self.new_from_filename(filename)
    file_data = filename.chomp(".mp3").split(" - ")
    new_song = self.new(file_data[1])
    new_song.artist = Artist.find_or_create_by_name(file_data[0])
    new_song.genre = Genre.find_or_create_by_name(file_data[2])
    new_song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
  
end