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

def self.new_by_name(name)
  song = Song.new
  song.name = name
  song
end

def self.create_by_name(name)
  song = self.new
  song.save
  song.name = name
  song
end

def self.find_by_name(name)
  self.all.find{|song| song.name == name}
end

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
end

def self.new_from_filename(file)
  twofiles = file.split(" - ")
  parsedartist = twofiles[0]
  parsedname = twofiles[1].sub(".mp3","")
  song = self.new
  song.name = parsedname
  song.artist_name = parsedartist
  song
end

def self.create_from_filename(file)
  twofiles = file.split(" - ")
  parsedartist = twofiles[0]
  parsedname = twofiles[1].sub(".mp3","")
  song = self.create
  song.save
  song.name = parsedname
  song.artist_name = parsedartist
end


def self.alphabetical
  @@all.sort_by {|song| song.name}
end

def self.destroy_all
  @@all.clear
end

end
