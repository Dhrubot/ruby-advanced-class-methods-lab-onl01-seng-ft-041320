class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.create
    song = self.new 
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    @@all.find {|ele| ele.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by {|ele| ele.name}
  end
  
  def self.new_from_filename(name)
    song = self.new
    name_array = name.split(" - ").chomp(".mp3")
    song.artist_name = name_array[0]
    song.name = name_array[1]
    @all << song
    song
  end
  
  def save
    self.class.all << self
  end

end
