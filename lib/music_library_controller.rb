require 'pry'
class MusicLibraryController
    attr_accessor :path, :music

    def initialize(path = './db/mp3s')
        @path = path
        @music = MusicImporter.new(path)
        @music.import
    end

    def call
        input = ""
        until input == "exit" 
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."  
                if input == 'list songs'
                    list_songs
                end   
            puts "To list all of the artists in your library, enter 'list artists'."
                if input == 'list artists'
                    list_artists
                end
            puts "To list all of the genres in your library, enter 'list genres'."
                if input == 'list genres'
                    list_genres
                 end
            puts "To list all of the songs by a particular artist, enter 'list artist'."
                if input == 'list artist'
                    list_songs_by_artist
                end
            puts "To list all of the songs of a particular genre, enter 'list genre'."
                if input == 'list genre'
                    list_songs_by_genre
                end
            puts "To play a song, enter 'play song'."
                if input == 'play song'
                    play_song
                end
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
            input = gets.chomp
        end 
        
        
  
    end 

    def list_songs
       # num = 0
        list = Song.all.sort{|song1, song2| song1.name <=> song2.name}
        list.each.with_index(1){|song, index| puts "#{index}. " + "#{song.artist.name} - " + "#{song.name} - " + "#{song.genre.name}"}
        #list.each{|song| puts "#{num += 1}. " + "#{song.artist.name} - " + "#{song.name} - " + "#{song.genre.name}"}
    end

    def list_artists
        list = Artist.all.sort{|artist1, artist2| artist1.name <=> artist2.name}
        list.each.with_index(1){|artist, index| puts "#{index}. " + "#{artist.name}"}   
    end

    def list_genres
        list = Genre.all.sort{|genre1, genre2| genre1.name <=> genre2.name}
        list.each.with_index(1){|genre, index| puts "#{index}. " + "#{genre.name}"}
    end 

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        artist = Artist.find_by_name(input)
            if artist
                list = artist.songs.sort{|song1, song2| song1.name <=> song2.name}
                list.each.with_index(1){|song, index| puts "#{index}. " + "#{song.name} - " + "#{song.genre.name}"}
            end    
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        genre = Genre.find_by_name(input)
            if genre 
                list = genre.songs.sort{|song1, song2| song1.name <=> song2.name}
                list.each.with_index(1){|song, index| puts "#{index}. " + "#{song.artist.name} - " + "#{song.name}"}
            end
    end

    def play_song 
        puts "Which song number would you like to play?"
        list = Song.all.sort{|song1, song2| song1.name <=> song2.name}
        input = (gets.strip.to_i)
            if (1..list.length).include?(input)  
                song = list[input - 1]
                puts "Playing #{song.name} by #{song.artist.name}"
            
            end
 #    binding.pry
    end 








end 

