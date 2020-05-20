class Artist
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods
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

    def add_song(song)
        !song.artist && song.artist = self # if song artist doesn't exist add this instance as the song artist
        !@songs.include?(song) && @songs << song # if songs array does not include passed song add it to the songs array.
    end

    def genres
        songs.map {|song| song.genre}.uniq
    end
end