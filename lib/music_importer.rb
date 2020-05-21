class MusicImporter
    attr_accessor :path

    def initialize(file_path)
        @path = file_path
    end

    def files
        file_name = Dir.chdir(self.path) do |file|
            Dir.glob("*.mp3")
        end
        file_name
    end

    def import
        files.each do |file|
            Song.create_from_filename(file)
        end
    end
end