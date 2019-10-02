require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    # everytime we create an instance and we call this method it will save it into our array.
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    self.new_by_name(song_name)
    # song = Song.create
    # song.name = song_name
    # song
    # @@all << song
    # song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    # checks to see if there is song_name named "Allison" and if there isn't any we need to create one. 
    self.find_by_name(song_name) || self.create_by_name(song_name)
    
    # song = self.find_by_name(song_name)
    # if self.find_by_name(song_name)
    #   self.find_by_name(song_name)
    # else 
    #   self.create_by_name(song_name)
    # end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song)
    split_file = song.split(" - ")
    artist = split_file[0]
    song_name = split_file[1].split(".")[0]

    # song_name = split_file[1].gsub(".mp3","")
    # binding.pry
    # song = Song.new
    # song.name = song_name
    # song.artist_name = artist
    # song
    
    song = self.new_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(song)
    ## if new_from_filename saves the song instance we can use the method it self
    self.new_from_filename(song)

    ##else 
    #song = self.new_from_filename(song)
    #song.save
    #song
  end

  def self.destroy_all
    self.all.clear
  end


end
