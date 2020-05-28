require_relative './concerns/findable.rb'

class Song
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist != nil
        self.genre = genre if genre != nil
    end

    def artist=(artist)
        @artist = artist
        @artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        @genre.songs << self unless @genre.songs.include?(self)
    end

    def save
        self.class.all << self unless self.class.all.include?(self)
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end

    def self.find_by_name(name)
        self.all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name)
            return self.find_by_name(name)
        else self.create(name)
        end
    end

    def self.new_from_filename(filename)
        file = filename.split(" - ")
        song_name = file[1]
        artist_name = file[0]
        genre_name = file[2].split(".mp3")[0]
        song = Song.find_or_create_by_name(song_name)
        created_artist = Artist.find_or_create_by_name(artist_name)
        created_genre = Genre.find_or_create_by_name(genre_name)
        song.artist = created_artist
        song.genre = created_genre
        song
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save
        song
    end


end
