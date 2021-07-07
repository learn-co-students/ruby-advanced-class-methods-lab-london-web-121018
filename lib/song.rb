require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil, artist_name=nil)
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(name, artist=nil)
    Song.new(name, artist)
  end

  def self.create_by_name(name, artist=nil)
    song_w_name = self.new_by_name(name, artist)
    self.all << song_w_name
    song_w_name
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    song_name = file_name.split(" - ")[1].chomp(".mp3")
    song_artist = file_name.split(" - ")[0]
    self.create_by_name(song_name, song_artist)
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end
  #binding.pry
end
# p "end"
