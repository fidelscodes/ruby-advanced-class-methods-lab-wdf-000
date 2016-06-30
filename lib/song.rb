require "pry"

# TODO: remove all comments before pushing

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
    self.all << self.new
    self.all.last
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song

    # why doesn't this work?
    # self.new.name = name
    # self.name
    # binding.pry
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    # in the block, song is equal to each object in @@all
    # remember that @@all is holding all Song objects created, not just names
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(self.find_by_name(name))
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
    # binding.pry
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song_info = filename.split(/\.mp3|\s-\s/)
    song = self.new # self = Song / Same as calling Song.new
    song.name = song_info[1]
    song.artist_name = song_info[0]
    song
    # binding.pry
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end

# binding.pry
end
