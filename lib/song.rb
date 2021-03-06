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
    song.artist_name = name.split(" - ")[0]
    song.name = name.split(" - ")[1].chomp(".mp3")
    @@all << song
    song
  end
  
  def self.create_from_filename(name)
    song = self.new
    new_from_filename(name)
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    self.class.all << self
  end

end
