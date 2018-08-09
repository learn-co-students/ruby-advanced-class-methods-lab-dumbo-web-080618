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
    @@all << song
    song
  end

  def self.new_by_name(name)
    new_name = self.new
    new_name.name = name
    new_name
  end

  def self.create_by_name(name)
    another_name = self.new
    another_name.name = name
    @@all << another_name
    another_name
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    array = file.split(' - ')
    artist = array[0]
    name_and_mp3 = array[1].split('.')

    result = self.new
    result.artist_name = artist
    result.name = name_and_mp3[0]
    result
  end

  def self.create_from_filename(file)
    array = file.split(' - ')
    artist = array[0]
    name_and_mp3 = array[1].split('.')

    result = self.new
    result.save
    result.artist_name = artist
    result.name = name_and_mp3[0]
    result
  end

  def self.destroy_all
    @@all.clear
  end
  # binding.pry

end
