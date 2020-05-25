require 'pry'

class Artist

    @@all =[]

    attr_accessor :name, :songs
    extend Concerns::Findable

    def initialize(name)
        @name = name
        @@all << self
        @songs = [] #creates a 'songs' property set to an empty array (artist has many songs)
    end

    def self.all
        @@all
    end

    def self.destroy_all #resets the @@all class variable to an empty array
        @@all.clear
    end

    def save #adds the Artist instance to the @@all class variable
        @@all
    end

    def self.create(artist)
        created_artist = Artist.new(artist)
        created_artist.save #invokes #save on that instance, forcing it to persist immediately.
        created_artist #calling that new artist instances
    end

    def songs #eturns the artist's 'songs' collection (artist has many songs)
        @songs
    end

    def add_song(song) #assigns the current artist to the song's 'artist' property (song belongs to artist)
        if song.artist != self
            song.artist = self
        end
        #  song.artist = self unless song.artist == self # I want to assign my song to this artist unless it is assigned to this artist already
         @songs << song unless songs.include?(song) # I want to add my song to the songs array unless the songs array includes this song already
        #  binding.pry
    end

    def genres #returns a collection of genres for all of the artist's songs (artist has many genres through songs)
       genres = Song.all.collect {|song| song.genre}
       genres.uniq
    end
end