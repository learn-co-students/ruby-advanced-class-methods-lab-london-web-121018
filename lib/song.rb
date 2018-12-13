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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
      song = Song.new
      song.name = name
      song.save
      song
  end

  def self.find_by_name(name)
    Song.all.find{|p| p.name == name}

  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
    self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |x|
      x.name
    end
  end

  def self.new_from_filename(mp3)
    song = Song.new
    data = mp3.split("-")
    data[1][0] = ""
    data[0][-1] = ""
    song.name = data[1].split(".mp3").join("")
    song.artist_name = data[0]
    song



  end

  def self.create_from_filename(mp3)
    song1 =  self.new_from_filename(mp3)
    @@all << song1
    song1
  end

  def self.destroy_all
    @@all.clear
  end
end
