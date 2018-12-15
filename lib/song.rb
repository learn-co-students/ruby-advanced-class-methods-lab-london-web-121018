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
    song.save
    song
  end

  def self.new_by_name(name)
    @name = name
    song = self.new
    song.name = @name
    song
  end


  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song_name| song_name.name == name }
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    song = self.new
    array = file.split(" - ")
    artist_name = array[0]
    song_file = array[1].split(".")
    name = song_file[0]
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(file)
    @@all << self.new_from_filename(file)
  end

  def self.destroy_all
    @@all.clear 
  end

end
