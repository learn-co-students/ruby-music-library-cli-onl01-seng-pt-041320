require_relative "./song.rb"
require_relative "./artist.rb"
require_relative "./genre.rb"

class MusicLibraryController
    attr_accessor :path, :musicimporter

    def initialize(path = "./db/mp3s")
        library = MusicImporter.new(path)
        library.import
    end

    def call 

        input = ' '

    while input != "exit"
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
    

        case input 
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
        # binding.pry
    end
    
    

    def list_songs
        Song.all.sort_by(&:name).each.with_index(1){|song, i|  puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
        # binding.pry
    end

    def list_artists
        artists = Artist.all.collect{|artist| artist.name}
        artists.sort!.uniq!
        artists.each.with_index(1){|artist, i| puts "#{i}. #{artist}"}
    end

    def list_genres
        genres = Genre.all.collect{|genre| genre.name}
        genres.sort!.uniq!
        # binding.pry
        genres.each.with_index(1){|genre, i| puts "#{i}. #{genre}"}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        songs = Song.all.sort!{|a, b| a.name <=> b.name}
        catalog = songs.find_all {|song| song.artist.name == input}
        catalog.each.with_index(1){|song, i| puts "#{i}. #{song.name} - #{song.genre.name}"}
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        songs = Song.all.sort!{|a, b| a.name <=> b.name}
        catalog = songs.find_all {|song| song.genre.name == input}
        catalog.each.with_index(1){|song, i| puts "#{i}. #{song.artist.name} - #{song.name}"}
    end
    
    def play_song
        puts "Which song number would you like to play?"
        input = gets.strip.to_i
        if (1..Song.all.length).include?(input)
            song = Song.all.sort_by(&:name)[input - 1]
        end
        puts "Playing #{song.name} by #{song.artist.name}" if song
    end

end