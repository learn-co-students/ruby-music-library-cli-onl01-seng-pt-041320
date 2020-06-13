# frozen_string_literal: true

class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  # List of inputs

  def call
    reply ''
    while reply != 'exit'
      puts 'Welcome to your music library!'
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all the songs by a particular artist, enter 'list artist'. "
      puts "To list all the songs by a particular genre, enter 'list genre'. "
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts 'What would you like to do?'
      reply = gets.strip

      # Set the CLI commands

      case reply
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      end
    end
  end

  # CLI Methods

  def list_songs
    # need to sort each songs by name
    sort(Song.all).each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} -#{song.genre.name}"
    end
  end

  def list_artists
    # need to sort each artists by name
    sort(Artist.all).each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
    end
  end

  def list_genres
    # sort each genres by name
    sort(Genres.all).each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
    end
  end

  def sort(list)
    # abstract the #sort mehod
    list.sort {|a, b} a.name <=> b.name
  end

  def list_songs_by_artist 
    # asking the user to input an artist name 
    puts "Please enter the name of an artist:"
    artist = gets.strip 
    # Print a list of artist songs, alphabetized by tittle.
    artists =  Song.all.select! {|song| song.artist.name == artist}
    sort(artists).each_with_index do |song, i| 
      puts "#{i + 1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre 
    # ask the user to input genre name 
    puts "Please enter the name of a genre:"
    genre = gets.strip 
    # Printing a list of genre's songs, alphabetized by title
    genres = Song.all.select! {|song| song.genre.name  == genre}
    sort(genres).each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song 
    # Asking user to chose a song 
    puts "Which son number would you like to play?"
    nimber = gets.strip.to_i 
    # Plays the selected song
    sort(Song.all).each_with_index do |song, i| 
      puts "Playing #{song.name} by #{song.artist.name}"
      if i + 1 == number
      end 
    end
end
