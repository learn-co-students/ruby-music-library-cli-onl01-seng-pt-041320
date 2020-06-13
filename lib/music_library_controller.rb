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
    # need to sort each artisrs by name
    sort(Artist.all).each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
    end
  end
end
