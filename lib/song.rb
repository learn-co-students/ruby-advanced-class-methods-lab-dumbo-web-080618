require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  #   # @@all << self
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(song)
    new_song = self.create
    new_song.name = song
    new_song
  end

  def self.create_by_name(song)
    new_song = self.new_by_name(song)
    new_song
  end

  def self.find_by_name(song)
    @@all.find { |x| x.name == song }
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song) != nil
      self.find_by_name(song)
    else
      self.create_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort_by {|songs| songs.name}
  end

  def self.new_from_filename(file_name)
    split_array = file_name.split(' - ')
    artist = split_array[0]
    song = split_array[1].split('.')
    result = self.new
    result.artist_name = artist
    result.name = song[0]
    return result
  end

  def self.create_from_filename(file_name)
    split_array = file_name.split(' - ')
    artist = split_array[0]
    song = split_array[1].split('.')

    result = self.new
    result.save
    result.artist_name = artist
    result.name = song[0]
    return result
  end

  def self.destroy_all
    @@all = []
  end

end
