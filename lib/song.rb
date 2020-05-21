class Song
    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=artist if artist != nil
        self.genre=genre if genre != nil
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
        song.name = name
        @@all << song
        song
    end

    def self.find_by_name(name)
        @@all.find{|songs| songs.name == name}
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name) == nil
            self.create(name)
        else
            self.find_by_name(name)
        end
    end

    def self.new_from_filename(file)
        song_info = file.chomp(".mp3").split(" - ")
        song = Song.find_or_create_by_name(song_info[1])
        genre = Genre.find_or_create_by_name(song_info[2])
        artist = Artist.find_or_create_by_name(song_info[0])
        song.genre = genre
        song.artist = artist
        song
    end

    def self.create_from_filename(file)
        file_name = Song.new_from_filename(file)
        file_name.save
        file_name
    end

    #Associations

    def artist=(artist) 
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        self.genre.add_song(self)
    end

end