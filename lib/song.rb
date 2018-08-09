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

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end

  def self.create_by_name(song_title)
    song = self.new
    song.name = song_title
    song.save
    song
  end

  def self.find_by_name(song_title)
    self.all.find{|song| song.name == song_title}
  end

  def self.find_or_create_by_name(song_title)
    self.find_by_name(song_title) || self.create_by_name(song_title)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    artist_split = filename.split(" - ")
    artist_name = artist_split[0]
    song_name = artist_split[1].split(".")[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    artist_split = filename.split(" - ")
    artist_name = artist_split[0]
    song_name = artist_split[1].split(".")[0]
    song = self.new
    song.save
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
