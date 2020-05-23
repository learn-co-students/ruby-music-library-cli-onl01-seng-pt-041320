require 'pry'
class MusicLibraryController

    def initialize(path = './db/mp3s')
        @path = path
        MusicImporter.new(path).import 
    end

    def call
        choice = ""
        while choice != "exit"
            puts "Welcome to your music library!"
            puts "What would you like to do?"
            choice = gets.chomp
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'." 
            case choice 
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
            num = 0
            list_array = Song.all.sort{|a, b| a.name <=> b.name}
            list_array.each_with_index do |song| 
            puts "#{num += 1}." + " " + "#{song.artist.name}" + " - " + "#{song.name}" + " - " + "#{song.genre.name}" 
            end 
    end 

    def list_artists
            num = 0
            list_array = Artist.all.sort{|a,b| a.name <=> b.name}
            list_array.each do |artist|
            puts "#{num += 1}." + " " + "#{artist.name}" 
            end
    end 

    def list_genres
            num = 0 
            list_array = Genre.all.sort{|a,b| a.name <=> b.name} 
            list_array.each do |genre|
            puts "#{num += 1}." + " " + "#{genre.name}"
            end 
    end 
    

    def list_songs_by_artist
            puts "Please enter the name of an artist:"
            choice = gets.chomp
        if artist = Artist.find_by_name(choice)
            songs = artist.songs.sort{|a, b| a.name <=> b.name}
            songs.each_with_index do |s, i|
            puts "#{i + 1}." + " " + "#{s.name}" + " - " + "#{s.genre.name}"
            end 
        
        end 
        
    end 

    def list_songs_by_genre
            puts "Please enter the name of a genre:"
            choice = gets.chomp
        if genre = Genre.find_by_name(choice)
            songs = genre.songs.sort{|a, b| a.name <=> b.name}
            songs.each_with_index do |s, i| 
            puts "#{i + 1}." + " " + "#{s.artist.name}" + " - " + "#{s.name}"
            end 
        end
    end 

    def play_song
        puts "Which song number would you like to play?"
        choice = gets.chomp.to_i 
        if (1..Song.all.length).include?(choice)
            song = Song.all.sort_by(&:name)[choice - 1]
        puts "Playing #{song.name} by #{song.artist.name}" if song
            
        end

    end 

    
            
end  

            

        
         
         
        
        
        
