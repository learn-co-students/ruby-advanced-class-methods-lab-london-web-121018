require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    return song

  end 

  def self.new_by_name(name)
    @name = name
    song = self.new
    song.name = @name
    song.save
    return song
  end
  def self.create_by_name(name)
    @name = name
    song = self.new
    song.name = @name
    song.save
    song
  end

  def self.find_by_name(name)
      self.all.find {|song| song.name ==name}
  end

  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      return song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    string_format = name.slice(0..-5)
    #removed file format off string
    song_array = string_format.split(" - ")
      artist_name = song_array[0]
      name = song_array[1]
      song = Song.new
      song.artist_name = artist_name
      song.name = name

      song

  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
      song.save
      song
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

end