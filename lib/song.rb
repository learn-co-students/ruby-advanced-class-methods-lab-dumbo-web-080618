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

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name (name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    s_info = file_name.split(" - ")
    artist = s_info[0]
    name = s_info[1][0..-5]
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
  s_info = filename.split(" - ")
  artist = s_info[0]
  name = s_info[1][0..-5]
  song = self.create_by_name(name)
  song.artist_name = artist
  end


  def self.destroy_all
  self.all.clear
  end


end
