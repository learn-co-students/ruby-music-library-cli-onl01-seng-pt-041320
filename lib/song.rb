require 'pry'
class Song
    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=(artist) if artist != nil
        self.genre=(genre) if genre != nil
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
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.find_by_name(name)
        self.all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(file_name)
        file_name_array = file_name.chomp(".mp3").split(" - ")
        artist = Artist.find_or_create_by_name(file_name_array[0])
        song = Song.find_or_create_by_name(file_name_array[1])
        genre = Genre.find_or_create_by_name(file_name_array[2])
        song.genre = genre
        song.artist = artist
        song
    end

    def self.create_from_filename(file_name)
        file = self.new_from_filename(file_name)
        file.save
        file
    end
end