class MusicLibraryController
    attr_accessor :path

    def initialize (path='./db/mp3s')
        @path = path
        new_import = MusicImporter.new(@path)
        new_import.import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        user_response = gets
        while user_response != "exit"
            user_response = gets
        end
    end

    def list_songs
        ordered_songs = Song.all.sort_by {|song| song.name}
        i = 1
        ordered_songs.each do |song|
            puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            i += 1
        end
    end

    def list_artists
        i = 1
        ordered_artists = Artist.all.sort_by {|artist| artist.name}
        ordered_artists.each do |artist|
            puts "#{i}. #{artist.name}"
            i += 1
        end
    end

    def list_genres
        i = 1
        ordered_genres = Genre.all.sort_by {|genre| genre.name}
        ordered_genres.each do |genre|
            puts "#{i}. #{genre.name}"
            i += 1
        end
    end

    def list_songs_by_artist
        i = 1
        puts "Please enter the name of an artist:"
        artist = gets
        songs = Song.all.select {|song| song.artist.name == artist}
        ordered_songs = songs.sort_by {|song| song.name}
        ordered_songs.each do |song|
            puts "#{i}. #{song.name} - #{song.genre.name}"
            i += 1
        end
    end

    def list_songs_by_genre
        i = 1
        puts "Please enter the name of a genre:"
        genre = gets
        songs = Song.all.select {|song| song.genre.name == genre}.sort_by{|song| song.name}
        songs.each do |song|
            puts "#{i}. #{song.artist.name} - #{song.name}"
            i += 1
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        song_number = gets
        index = song_number.to_i - 1
       # array_index = song_number - 1
        puts "Playing song #{list_songs[song_number.to_i].name}" 
    end

end