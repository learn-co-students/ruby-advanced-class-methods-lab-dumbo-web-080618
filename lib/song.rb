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

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.new_by_name(name)
    self.create_by_name(name)
  end

  def self.find_by_name(name)
    self.all.find{|title| title.name == name}
  end

  def self.find_or_create_by_name(name)
    if (self.find_by_name(name) != nil)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|x| x.name}
  end

  def self.destroy_all
    @@all = []
  end

  def self.new_from_filename(filename_format)
    file = filename_format.split(' - ')
    song = self.new
    song.name = file[1].split('.')[0]
    song.artist_name = file[0]
    song
    # binding.pry
  end

  def self.create_from_filename(filename_format)
    self.all << self.new_from_filename(filename_format)
  end
end
#End of class
