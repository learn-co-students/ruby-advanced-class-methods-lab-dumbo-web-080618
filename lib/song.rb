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
    new_song = Song.new #creating a new song
    new_song.save #saving the song because save is a function that does that
    new_song #return new song
  end

  def self.new_by_name(song_name)
  new_song = Song.new
  new_song.name = song_name
  new_song
  end

  def self.create_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find do |obj|
      if obj.name == song_name
      return obj
    end
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      return self.create_by_name(song_name)
    else
      return self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    sorted = @@all.sort_by do |obj|
      obj.name
    end
    sorted
  end

  def self.new_from_filename(string)
    new_song = Song.new
    stringArray = string.split('-')
    new_song.artist_name = stringArray[0].strip

    song_name = stringArray[1].split('.')
    new_song.name = song_name[0].strip
    new_song
  end

  def self.create_from_filename(string)
    new_song = Song.new
    stringArray = string.split('-')
    new_song.artist_name = stringArray[0].strip

    song_name = stringArray[1].split('.')
    new_song.name = song_name[0].strip
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
