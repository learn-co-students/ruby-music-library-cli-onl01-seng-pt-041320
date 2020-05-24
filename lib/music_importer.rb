class MusicImporter
    attr_accessor :path 

    def initialize(path)
        @path = path
    end

    def files
        file = Dir.entries(@path)
        file.find_all {|x|x.match(/\.mp3/)}
    end 

    def import 
        files.each do |x|
            Song.create_from_filename(x)
        end
    end 







end