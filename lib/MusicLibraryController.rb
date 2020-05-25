require 'pry'

class MusicLibraryController 

    attr_accessor :path, :song, :artist, :genre

    def initialize(path = './db/mp3s')
        @path = path
       new_import =  MusicImporter.new(path)
       new_import.import
    end

    def call
        user_response =  "" #or "". strip: cleanup all newline characters around string. Ex:”\n\nHello\n\n”

        while user_response != "exit"
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
            user_response = gets.strip
                case user_response
                when "list songs"
                        list_songs
                when "list artists"
                        list_artists
                when "list genres"
                        list_genres
                when "list artist"
                        list_songs_by_artist
                when "list genre"
                        list_songs_by_genre
                when "play song"
                        play_song
                end
        end
    end
    
    def list_songs
        ordered_list = Song.all.sort_by {|song|song.name}
        i = 1
        ordered_list.each do |song|
            puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            i += 1
        end
            # binding.pry
    end

    def list_artists
        ordered_artists = Artist.all.sort_by {|artist| artist.name}
        i = 1
        ordered_artists. each do |artist|
            puts "#{i}. #{artist.name}"
            i += 1
        end
    end

    def list_genres
        ordered_genres = Genre.all.sort_by {|genre| genre.name}
        i = 1
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
        songs = Song.all.select {|song| song.genre.name == genre}
        ordered_songs = songs.sort_by {|song| song.name}
        ordered_songs.each do |song|
            puts "#{i}. #{song.artist.name} - #{song.name}"
            i += 1
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        input = gets.to_i
        if input > 0 && input <= Song.all.length
          array = Song.all.sort{|a, b| a.name <=> b.name}
          song = array[input-1]
          puts "Playing #{song.name} by #{song.artist.name}"

        end
    end
end