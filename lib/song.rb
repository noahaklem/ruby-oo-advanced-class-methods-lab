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
    self.all << song
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
    self.all.find{|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    parts = file.split(" - ")
    artist = parts[0]
    title = parts[1].chomp('.mp3')

    song = self.new
    song.artist_name = artist
    song.name = title
    song
  end

  def self.create_from_filename(file)
    parts = file.split(" - ")
    artist = parts[0]
    title = parts[1].chomp('.mp3')

    song = self.create
    song.artist_name = artist
    song.name = title
  end

  def self.destroy_all
    self.all.clear
  end

end
