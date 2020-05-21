require 'bundler'
Bundler.require


module Concerns::Findable
  def initialize(name)
    #memorable instance
    @name = name
  end
  
  def all
    #memorable class
    @@all
  end
  
  def destroy_all
    #memorable class
    self.all.clear
  end
  
  def save
    #memorable class
    @@all << self
  end
  
  def create(name)
    #memorable class
    artist = self.new(name)
    artist.save
    artist
  end


require_all 'lib'
