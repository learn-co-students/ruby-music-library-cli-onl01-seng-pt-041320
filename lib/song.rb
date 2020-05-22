class Song

    attr_accessor :name, :genre, :artist

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist != nil
        self.genre = genre if genre != nil
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
        song = Song.new(name)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist
        self.artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        self.genre.add_song(self)
    end

    def self.find_by_name(name)
        self.all.find{|song|song.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(file)
        file_name = file.chomp(".mp3").split(" - ")
        artist = Artist.find_or_create_by_name(file_name[0])
        song = Song.find_or_create_by_name(file_name[1])
        genre = Genre.find_or_create_by_name(file_name[2])
        song.genre = genre
        song.artist = artist
        song
    end
    
    def self.create_from_filename(file)
        file_name = Song.new_from_filename(file)
        file_name.save
        file_name
    end
end