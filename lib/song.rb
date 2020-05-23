require 'pry'
class Song
    attr_accessor :name, :artist, :genre  
     
    @@all = []

    def initialize(name, artist = nil, genre = nil) 
        @name = name
        self.artist= artist if artist
        self.genre= genre if genre

    end 
    
    def self.all
        @@all 
    end 

    def self.destroy_all
        @@all.clear 
    end 

    def self.create(name)
        new_song = Song.new(name)
        new_song.save 
        new_song 
    end  
    
    def self.new_from_filename(filename)
        #binding.pry
        array = filename.chomp(".mp3").split(" - ")
        song = self.new(array[1])
        song.artist = Artist.find_or_create_by_name(array[0])
        song.genre = Genre.find_or_create_by_name(array[2])
        song 
    end 

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename).save
    end

        
    def save 
        @@all << self 
    end    
     
    def artist=(artist)   
        @artist = artist
        artist.add_song(self) 
    end
    
    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self) 
    end 

    def self.find_by_name(name)
        @@all.detect{|song| song.name == name}
    end 

    def self.find_or_create_by_name(name)
        self.find_by_name(name) ? self.find_by_name(name) : self.create(name) 
    end 
    
end 