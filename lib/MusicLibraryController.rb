class MusicLibraryController
   

def initialize(path = './db/mp3s')
   MusicImporter.new(path).import
end

def call
    input = " "
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
                self.list_songs
           when "list artists"
                self.list_artists
           when "list genres"
                self.list_genres
           when "list artist"
                self.list_songs_by_artist
           when "list genre"
                self.list_songs_by_genre
           when "play song"
                self.play_song
           end




end
end

def list_songs
    # Song.all.sort_by.each.with_index(1) do |song, index|
    #     puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    sorted_song_list =  Song.all.sort_by do |obj|
        obj.name
   end 
   sorted_song_list.each.with_index(1) do |obj, index|
    puts "#{index}. #{obj.artist.name} - #{obj.name} - #{obj.genre.name}"
   end

end 

def list_artists
    sorted_artist_list =  Artist.all.sort_by do |obj|
        obj.name
   end 
   sorted_artist_list.uniq.each.with_index(1) do |obj, index|
    puts "#{index}. #{obj.name}"
   end

end    

def list_genres
    sorted_genre_list =  Genre.all.sort_by do |obj|
        obj.name
   end 
   sorted_genre_list.uniq.each.with_index(1) do |obj, index|
    puts "#{index}. #{obj.name}"
   end
end

   def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
        artist_songs =  artist.songs.sort_by do |obj|
            obj.name 
    end
   artist_songs.each.with_index(1) do |obj, index|
    puts "#{index}. #{obj.name} - #{obj.genre.name}"
   end
    end
end    

def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
        genre_songs =  genre.songs.sort_by do |obj|
            obj.name 
    end
   genre_songs.each.with_index(1) do |obj, index|
    puts "#{index}. #{obj.artist.name} - #{obj.name}"
   end
    end
end 

def play_song
    puts "Which song number would you like to play?"
    input = gets.strip

    sorted_song_list =  Song.all.sort_by do |obj|
        obj.name
   end 
   sorted_song_list.each.with_index(1) do |obj, index|
    if input == index.to_s
    puts "Playing #{obj.name} by #{obj.artist.name}"
   end
end
    
end 
end
