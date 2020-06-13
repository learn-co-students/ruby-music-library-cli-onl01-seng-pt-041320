# frozen_string_literal: true

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all 
    @@all 
  end 

  def save
    @@all << self
  end

  def self.destroy_all 
    @@all.clear
  end

  def self.create(name)
    song =self.new(name)
    song.save
    song
  end

  
  end
