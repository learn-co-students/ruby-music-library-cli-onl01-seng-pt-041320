class Genre
attr_accessor :name, :songs
extend Concerns::Findable

@@all = []

def initialize(name)
    @name = name
    @songs = []
end

def self.all
    @@all
end

def self.destroy_all
    @@all = []
end

def self.create(name)
    genre = self.new(name)
    genre.save
    genre
end

def save 
    @@all << self
end

def artists
    songs.map {|songs| songs.artist}.uniq
end

end