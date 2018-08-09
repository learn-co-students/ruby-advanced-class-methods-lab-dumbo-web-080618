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
    songs = self.new
    @@all<< songs
    songs
  end

  def self.new_by_name(name)
    new_name = self.new
    new_name.name  = name
    new_name
  end

  def self.create_by_name(name)
    abc = self.new
    abc.name  = name
    @@all << abc
    abc
  end

  def self.find_by_name(name)
    @@all.find {|songs| songs.name == name}
  end

def self.find_or_create_by_name(name)
  if !(self.find_by_name(name))
    self.create_by_name(name)
  else
    self.find_by_name(name)
  end
end

def self.alphabetical
  @@all.sort_by {|songs| songs.name}
end

def self.new_from_filename(file)
  rows  = file.split(' - ')
  artist = rows[0]
  second = rows[1].split(".")

  results = self.new
  results.artist_name = artist
  results.name = second[0]
  results
end


def self.create_from_filename(file)
  rows  = file.split(' - ')
  artist = rows[0]
  second = rows[1].split(".")

  results = self.new
  results.save
  results.artist_name = artist
  results.name = second[0]
  results
end

def self.destroy_all
  @@all.clear
end



end
