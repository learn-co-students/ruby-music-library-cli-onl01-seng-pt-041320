
class Song
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods
    extend Concerns::Findable

    attr_accessor :name, :genre
    attr_reader :artist
    @@all = []

    def initialize (name, artist=nil, genre=nil)
        @name = name
        self.genre=(genre)
        self.artist=(artist)
    end

    def self.all
        @@all
    end

    def artist=(artist)
        if artist
          @artist= artist
          artist.add_song(self)
        end
    end

    def genre=(genre)
        if genre
            @genre = genre
            !genre.songs.find {|song| song == self} && genre.songs << self  #if the song doesn't exist among genre's songs add it.
        end
    end

end