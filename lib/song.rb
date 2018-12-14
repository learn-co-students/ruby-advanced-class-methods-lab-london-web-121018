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
    self.all << song
    song
  end

  def self.new_by_name(string)
    song = Song.new
    song.name = string
    song
  end

  def self.create_by_name(string)
    song = Song.new
    song.name = string
    @@all << song
    song
  end

  def self.find_by_name(string)
    @@all.find do |song|
      song.name == string
    end
  end

  def self.find_or_create_by_name(string)
    #binding.pry
    if Song.find_by_name(string)
        Song.find_by_name(string)
    else
      Song.create_by_name(string)
    end
  end

  def self.alphabetical
    @@all.sort_by! {|person| person.name}
  end

  def self.new_from_filename(string)
    delimiters = [' - ','.']
    song = Song.new
    toselect = string.split(Regexp.union(delimiters))
    song.artist_name = toselect[0]
    song.name = toselect[1]
    song
    
  end

  def self.create_from_filename(string)
    delimiters = [' - ','.']
    song = Song.new
    toselect = string.split(Regexp.union(delimiters))
    song.artist_name = toselect[0]
    song.name = toselect[1]
    @@all << song
    song
    
  end

    def self.destroy_all
      @@all.clear
    end

end
