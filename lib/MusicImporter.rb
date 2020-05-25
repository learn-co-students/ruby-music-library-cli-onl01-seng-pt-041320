class MusicImporter

   attr_accessor :path, :name

    def initialize(path) #accepts a file path to parse MP3 files from
        @path = path # #path retrieves the path provided to the MusicImporter object
    end
    
    def files
        Dir.chdir(@path) {|path| Dir.glob("*.mp3")} #loads all the MP3 files in the path directory
        # normalizes the filename to just the MP3 filename with no path
    end

    def import
       files.each {|filename| Song.create_from_filename(filename)}
    end

end