require 'pry'

class Song
    
    @@all = []
    
    attr_accessor :name
    
    def initialize(name, artist = nil, genre = nil)
        @name = name
        if artist != nil
            self.artist = artist
        end

        if genre != nil
            self.genre = genre
        end

        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all
    end

    def self.create(song) #initializes, saves, and returns the song
        created_song = Song.new(song)
        created_song.save
        created_song
    end

    def artist
        @artist
    end
   
    def artist=(artist) #invokes Artist#add_song to add itself to the artist's collection of songs (artist has many songs)
        @artist = artist 
        artist.add_song(self)
        # @artist = artist unless @artist == artist 
        # artist.add_song
        # binding.pry
    end 
    def genre
        @genre
    end
   
    def genre=(genre)
        @genre = genre 
        #adds the song to the genre's collection of songs (genre has many songs)
        genre.songs << self unless genre.songs.include?(self) #does not add the song to the genre's collection of songs if it already exists therein
    end 

    def self.find_by_name(name) #finds a song instance in @@all by the name property of the song
        all.find {|song| song.name == name}
        # learn.pry
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)    
    end

    def self.new_from_filename(filename) #initializes a song based on the passed-in filename
        artist_name = filename.split(" - ")[0]
        song_name = filename.split(" - ")[1]
        genre_name = filename.split(" - ")[2].chomp(".mp3")
        song = self.find_or_create_by_name(song_name)
        song.artist = Artist.find_or_create_by_name(artist_name)
        song.genre = Genre.find_or_create_by_name(genre_name)
        song
        # binding.pry
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save
    end
end