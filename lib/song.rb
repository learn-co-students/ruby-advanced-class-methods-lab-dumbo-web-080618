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

  def Song.create
      song = self.new
      song.save
      song
  end

  def Song.new_by_name(song_name)
    #binding.pry
      #create a new Song and set it to a new varable
      song = self.new
      #set the name to the name that was passed into this function
      song.name = song_name
      #return the song object
      song
  end

  def Song.create_by_name(song_name)
    #create a new Song and set it to a new varable
    song = self.create
    #set the name to the name that was passed into this function
    song.name = song_name
    #return the song object
    song
  end

  def Song.find_by_name(song_name)
    #binding.pry
    song = @@all.find{|song|  song.name == song_name }
  end

  # def Song.find_or_create_by_name(song_name)
  #   self.find_by_name(song_name) || self.create_by_name(song_name)
  # end
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    #binding.pry
     self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(file)
    #binding.pry
    array=file.chomp(".mp3").split(" - ")
    artist_name = array[0]
    song_name = array[1]

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end

  def Song.destroy_all
    self.all.clear
  end

end
