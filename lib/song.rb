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
    @@all << self.new
    @@all[@@all.length-1]
  end

  def self.new_by_name(name)
    song_title = self.create
    song_title.name = name
    song_title
  end

  def self.create_by_name(name)
    song_title = self.new_by_name(name)
    song_title
  end

  def self.find_by_name(name)
    answer = nil
    @@all.each do |song|
      if song.name == name
        answer = song
      end
    end
    answer
  end

  def self.find_or_create_by_name(name)
    answer = nil
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|a| a.name}
  end

  def self.new_from_filename(filename)
    splited_filename = filename.split(".")
    if splited_filename[1] == "mp3"
      song_artist = splited_filename[0].split(" - ")
      song_title = self.find_or_create_by_name(song_artist[1])
      song_title.artist_name = song_artist[0]
      song_title
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end
end
