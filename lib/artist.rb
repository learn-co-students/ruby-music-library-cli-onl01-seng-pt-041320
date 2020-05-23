require 'pry'
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

    def self.create(name)
        new_artist = Artist.new(name)
        new_artist.save 
        new_artist 
    end 

    def self.destroy_all 
        @@all.clear 
    end 

    def save 
        @@all << self 
    end 

    def add_song(song) 
       song.artist = self unless song.artist == self
       @songs << song unless @songs.include?(song)  
    end 

    #returns array of genres. gets genres from songs. artist has songs. no duplicates
    def genres
        #binding.pry
        self.songs.collect{|song| song.genre}.uniq
    end 
        
    
    

    

end 