class MusicImporter

    attr_accessor :path, :song

    def initialize(path)
        @path = path
    end

    def files
        tracks = Dir.chdir(path) do |path|
            Dir.glob("*.mp3")
        end
        tracks
    end

    def import
        files.each {|track| Song.create_from_filename(track)}
    end

end