class Room

  attr_reader :name
  attr_accessor :guests, :songs

  def initialize(name)

    @name = name
    @guests = []
    @songs = []

  end

  def check_in(guest)
    @guests << guest
  end

  def check_out
    @guests.clear
  end


  def add_playlist_to_room(playlist)
    @songs << playlist
    @songs = @songs.flatten
  end

  def add_song_to_room(song)
    @songs << song
  end






end
