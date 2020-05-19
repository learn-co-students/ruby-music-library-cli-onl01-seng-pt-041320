class Genre
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods
    extend Concerns::Findable

    attr_accessor :name
    @@all = []

    def initialize (name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def songs
        @songs
    end

    def artists
        songs.map {|song| song.artist}.uniq    #goes over songs and builds a new array of artist elements (.uniq avoid duplicates)
    end
end