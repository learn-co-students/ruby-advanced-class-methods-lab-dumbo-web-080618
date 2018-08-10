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
    new_song = self.new
    @@all << new_song
    return new_song
  end
  def self.new_by_name(name)
    create_song = self.new
    create_song.name = name
    return create_song
  end
  def self.create_by_name(name)
    create_by_name = self.new
    create_by_name.name = name
    @@all << create_by_name
    return create_by_name
  end
  def self.find_by_name(name)
    @@all.find{|song_name| song_name.name == name}
  end

  def self.find_or_create_by_name(name)
    if !(find_by_name(name))
      return create_by_name(name)
    else
      return find_by_name(name)
    end
  end
  def self.alphabetical
    @@all.sort_by{|song_name| song_name.name}
  end
  def self.new_from_filename(file)
    # file.split(" - ")  is now an array and have been split
    new_arr = file.split(" - ")
    artist = new_arr[0]
    song_name = new_arr[1].split(".")
    new_file = self.new
    new_file.artist_name = artist #i want the new artist replace the existing one under a new file
    new_file.name = song_name[0]
    return new_file
  end
  def self.create_from_filename(file)
    new_arr = file.split(" - ")
    artist = new_arr[0]
    song_name = new_arr[1].split(".")
    new_file = self.new
    new_file.save
    new_file.artist_name = artist #i want the new artist replace the existing one under a new file
    new_file.name = song_name[0]
    return new_file #we are saving the new_file in line 57 and returning the new_file as it's being changed and saved
  end
  def self.destroy_all
    @@all.clear
  end
end
