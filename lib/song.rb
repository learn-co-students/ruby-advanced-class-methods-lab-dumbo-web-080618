require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    # @@all << instance
  end

  def self.create
    song = self.new
    song.save
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
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    matching_song = self.find_by_name(name)
    if matching_song
      return matching_song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    return self.all.sort_by {|song| song.name}
  end

  def split_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    self.name = split_filename[1]
    self.artist_name = split_filename[0]
  end

  def self.new_from_filename(filename)
    song = self.new
    song.split_filename(filename)
    song.save
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end
