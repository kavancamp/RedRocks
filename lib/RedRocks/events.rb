require 'pry'

class RedRocks::Event
  attr_accessor :title, :artist, :timestamp, date, :url, :description

  @@all = []

  def initialize(title, artist, timestamp, url, date, description)
    @title = title
    @artist = artist
    @date = date
    @timestamp = timestamp
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_index(index)
    @@all[index]
  end
end