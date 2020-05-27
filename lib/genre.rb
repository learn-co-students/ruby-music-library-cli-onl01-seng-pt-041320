class Genre
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

    def artists
        newarray = []
        songs.map do |song|
        newarray << song.artist
    end
        newarray.uniq
end
    def songs
        @songs
    end

    def add_song(song)
        if !@songs.include?(song)
            @songs << song 
        end

        if !(song.genre)
            song.genre = self
        end
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