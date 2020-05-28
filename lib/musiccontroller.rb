class MusicLibraryController
    attr_accessor :path

    def initialize(path = "./db/mp3s")
        @path = path
        importer = MusicImporter.new(path)
        importer.import
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
            
        input = gets.strip

        if input == "list songs"
            list_songs
        elsif input == "list artists"
            list_artists
        elsif input == "list genres"
            list_genres
        elsif input == "list artist"
            list_songs_by_artist
        elsif input == "list genre"
            list_songs_by_genre
        elsif input == "play song"
            play_song
        elsif input == "exit"
        else 
           call
        end


    end

    def list_songs
        songs = Song.all.sort_by{|song| song.name}
        songs.each_with_index do |song, index|
              puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        artists = Artist.all.sort_by{|artist| artist.name}
        artists.each_with_index do |artist, index|
              puts "#{index + 1}. #{artist.name}"
        end
    end

    def list_genres
        genres = Genre.all.sort_by{|genre| genre.name}
        genres.each_with_index do |genre, index|
              puts "#{index + 1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        songs = Song.all.select{|song| song.artist.name == input}
        sorted_songs = songs.sort_by{|song| song.name}
        sorted_songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        songs = Song.all.select{|song| song.genre.name == input}
        sorted_songs = songs.sort_by{|song| song.name}
        sorted_songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name}"
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        input = gets.strip
        new_input = input.to_i
        if new_input > 1 && new_input <= Song.all.length
            songs = Song.all.sort_by{|song| song.name}
            selected_song = songs[new_input - 1]
            puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
        end
    end

end

puts "To list all of your songs, enter 'list songs'."
puts "To list all of the artists in your library, enter 'list artists'."
puts "To list all of the genres in your library, enter 'list genres'."
puts "To list all of the songs by a particular artist, enter 'list artist'."
puts "To list all of the songs of a particular genre, enter 'list genre'."
puts "To play a song, enter 'play song'."
puts "To quit, type 'exit'."
puts "What would you like to do?"