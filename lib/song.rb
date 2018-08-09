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
    return song 
  end
  
  def self.new_by_name(title)
    song = self.new
    song.name = title 
    return song 
  end
  
  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song 
    return song 
  end
  
  def self.find_by_name(title)
    self.all.find do |song|
      if song.name == title
        return song
      end
    end
  end
  
  def self.find_or_create_by_name(title)
     if self.find_by_name(title) == nil 
        self.create_by_name(title)
      else 
        self.find_by_name(title)
     end
  end 
    
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
    
  def self.new_from_filename(title)

    
    artist = title.split(" - ")
    abc = artist[0]
    song_name = artist[1].split(".")
    
    song = self.new 
    song.artist_name = abc
    song.name = song_name[0] 
    return song 
  end
  
  def self.create_from_filename(title)
    
    
artist = title.split(" - ")
    abc = artist[0]
    song_name = artist[1].split(".")
    
    song = self.new 
    song.save
    song.artist_name = abc
    song.name = song_name[0] 
    return song 
 

    return song_match 
  end
  
  def self.destroy_all
    self.all.clear
  end
end

