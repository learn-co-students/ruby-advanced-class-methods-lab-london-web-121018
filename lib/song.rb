require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.select{|item| item.name == name}.shift
  end

  def self.find_or_create_by_name(name)
    song = Song.create_by_name(name)
    find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    artist, name = filename.split("-")
    song.artist_name = artist.strip
    song.name = name.strip.gsub(".mp3","")
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end


end
