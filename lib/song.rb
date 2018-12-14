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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name)
      find_by_name(song_name)
    else
      create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort do |song1, song2|
      song1.name <=> song2.name
    end
  end

  def self.new_from_filename(song_file)
    song = self.new
    song_array = song_file.split(" - ")
    artist = song_array[0]
    song_name = song_array[1].split(".")[0]
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(song_file)
    self.all << new_from_filename(song_file)
  end

  def self.destroy_all
    self.all.clear
  end

end

#Test Method
song_file1 = "Thundercat - For Love I Come.mp3"

# binding.pry
