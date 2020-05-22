class Song
    attr_accessor :name
    attr_reader :artist, :genre
    extend Concerns::Findable
    
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
        save
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        if !self.genre
            @genre = genre
            genre.songs << self
        end
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        song = Song.new(name)
        # song.save
        # song
    end

    def self.find_by_name(name)
        self.all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(file_name)
        track = file_name.chomp(".mp3").split(" - ")
        artist = Artist.find_or_create_by_name(track[0])
        genre = Genre.find_or_create_by_name(track[2])
        song = self.new(track[1], artist, genre)
    end

    def self.create_from_filename(file_name)
        track = file_name.chomp(".mp3").split(" - ")
        self.new_from_filename(file_name) || self.create(track[0])
    end

end