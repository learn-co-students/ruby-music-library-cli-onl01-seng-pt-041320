require 'pry'
class MusicLibraryController

    def initialize(path = './db/mp3s')
        #binding.pry
        @path = path
        MusicImporter.new(path).import 
    end

    def call
        choice = ""
        while choice != "exit"
            puts "Welcome to your music library!"
            puts "What would you like to do?"
                
        
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."   
            choice = gets.chomp
        end
    end  

    def list_songs
        num = 0
        list_array = Song.all.sort{|a, b| a.name <=> b.name}
        list_array.each_with_index do |song| 
        puts "#{num += 1}." + " " + "#{song.artist.name}" + " - " + "#{song.name}" + " - " + "#{song.genre.name}" 
    end 

    def list_artists
        num = 0
        list_array = Artist.all.sort{|a,b| a.name <=> b.name}
        list_array.each do |artist|
        puts "#{num += 1}." + " " + "#{artist.name}" 
    end 

    def list_genres
        num = 0 
        list_array = Genre.all.sort{|a,b| a.name <=> b.name} 
        list_array.each do |genre|
        puts "#{num += 1}." + " " + "#{genre.name}"
    end 

    def list_songs_by_artist
        choice = ""
        puts "Please enter the name of an artist:"
        choice = gets.chomp
        artist = Artist.find_by_name(choice)
        binding.pry
        artist.songs.all.sort{|a,b| a.name <=> b.name}.each_with_index(1) do |s, i|
        puts "#{i}." + " " + "#{s.artist}" + " - " + "#{s.genre}" 
        
    end 
            
end  

            

        
         
         
        
        
        
end  
end     
end
end 