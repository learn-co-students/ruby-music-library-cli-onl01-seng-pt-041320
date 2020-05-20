
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

    def self.new_from_filename (filename)
        array = filename.split(" - ")
        new_artist = Artist.find_or_create_by_name(array[0])
        new_genre = Genre.find_or_create_by_name(array[2].chomp('.mp3'))
        new_song = self.new(array[1], new_artist, new_genre)
        new_song
        #binding.pry
    end

    def self.create_from_filename (filename)
        song = self.new_from_filename (filename)
        song.save
    end


end