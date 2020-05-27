class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs, :genre

    @@all = []
   
    def initialize (name)
        @name = name
        @songs  = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all.clear
    end
    def self.create(name)
        song = self.new(name)
        song.save
        song
    end

    def add_song(song)
        if !@songs.include?(song)
            @songs << song 
        end

        if !(song.artist)
            song.artist = self
        end
    end   
        # song.artist = self
        # if song.artist = self
        # else

    def genres
        newarray = []
        songs.map do |song|
        newarray << song.genre
    end
        newarray.uniq
end
# def self.find_by_name(name)
#     all.find{|song| song.name == name}
#     end

# def self.find_or_create_by_name(name)
#     if self.find_by_name(name)
#     self.find_by_name(name)
#     else
#     self.create(name)
#     end
# end
    
end