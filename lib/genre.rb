# frozen_string_literal: true

class Genre
  attr_accessor :name
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @song = []
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
    genre = new(name)
    genre.save
    genre
  end

  attr_reader :songs

  def artist
    songs.map(&:artist) .uniq
    end
end
