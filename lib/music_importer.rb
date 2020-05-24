class MusicImporter
    attr_accessor :path 

    def initialize(path)
        @path = path
    end

    def files
        file = Dir.entries(@path)
        file.find_all {|x|x.match(/\.mp3/)}
    end 







end