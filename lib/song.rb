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
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      return find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(song_filename)
    song_minus_mp3 = song_filename.slice(0..-5)
    artist_and_song_array = song_minus_mp3.split(" - ")
    artist  = artist_and_song_array[0]
    name =  artist_and_song_array[1]
    song = self.new
    song.artist_name = artist
    song.name = name
    return song
  end

  def self.create_from_filename(filename)
    self.all  << new_from_filename(filename)
  end

end
