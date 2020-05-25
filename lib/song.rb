require 'pry'
class Song
    attr_accessor :name
    attr_reader :artist, :genre 

    @@all = [] 
    def initialize(name, artist = nil, genre = nil)
        @name = name 
        self.artist = artist if artist
        self.genre = genre if genre
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

   def artist=(artist)
        @artist = artist 
        artist.add_song(self) 
   end

   def genre=(genre)
        @genre = genre
        if !genre.songs.include?(self)
            genre.songs << self
        end
   end

   def self.find_by_name(name)
        self.all.detect{|song| song.name == name}
   end

   def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
   end

   def self.new_from_filename(file)
        filename = file.split(" - ")
        songname = filename[1]
        artistname = filename[0]
        genrename = filename[2].split(".mp3")
        song = self.new(songname)
        song.artist = Artist.find_or_create_by_name(artistname)
        song.genre = Genre.find_or_create_by_name(genrename[0])
        song
   end 

   def self.create_from_filename(file)
        song = self.new_from_filename(file)
        song.save  
   end 







end 