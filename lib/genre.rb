
require_relative '../lib/concerns/Findable.rb'

class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name)
  end

  def artists
    artists = []
    Song.all.each do |song|
      if song.genre == self && !artists.include?(song.artist)
        artists << song.artist
      end
    end
    artists
  end


end
