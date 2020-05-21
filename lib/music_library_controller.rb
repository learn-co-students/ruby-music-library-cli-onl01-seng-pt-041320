require 'pry'
require "awesome_print"
class MusicLibraryController
    def initialize(file_path = './db/mp3s')
        @path = file_path
        file = MusicImporter.new(file_path)
        file.import
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
        
        selection = gets.chomp

        case selection
        when 'list songs'
            self.list_songs
        when 'list artists'
            self.list_artists
        when 'list genres'
            self.list_genres
        when 'list artist'
            self.list_songs_by_artist
        when 'list genre'
            self.list_songs_by_genre
        when 'play song'
            self.play_song
        when 'exit'
            'exit'
        else
            call
        end
    end

    def list_songs
        sorted_list = Song.all.sort {|a, b| a.name <=> b.name}.uniq
        sorted_list.each.with_index(1) do |song, i|
            puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        #binding.pry
        sorted_list = Artist.all.sort {|a, b| a.name <=> b.name}.uniq
        sorted_list.each.with_index(1) do |artist, i|
            puts "#{i}. #{artist.name}"
        end
    end

    def list_genres
        sorted_list = Genre.all.sort {|a, b| a.name <=> b.name}.uniq
        sorted_list.each.with_index(1) do |artist, i|
            puts "#{i}. #{artist.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets.chomp

        if artist = Artist.find_by_name(user_input)
            sorted_list = artist.songs.sort{|a, b| a.name <=> b.name}.uniq
            sorted_list.each.with_index(1) {|song, i| puts "#{i}. #{song.name} - #{song.genre.name}"}
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        user_input = gets.chomp

        if genre = Genre.find_by_name(user_input)
            sorted_list = genre.songs.sort{|a, b| a.name <=> b.name}.uniq
            sorted_list.each.with_index(1) {|song, i| puts "#{i}. #{song.artist.name} - #{song.name}"}
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        user_input = gets.chomp.to_i

        if user_input > 0 && user_input <= Song.all.length
            array = Song.all.sort{|a, b| a.name <=> b.name}.uniq
            if array[user_input - 1] != nil
                song = array [user_input - 1]
                puts "Playing #{song.name} by #{song.artist.name}"
            end
        end
    end
end