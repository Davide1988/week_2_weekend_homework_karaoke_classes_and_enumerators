require("minitest/autorun")
require('minitest/rg')
require_relative("../room")
require_relative('../guest')
require_relative('../song')

class RoomTest < MiniTest::Test

  def setup


    @song_1 = Song.new("Iris")
    @song_2 = Song.new("Wonderwall")
    @song_3 = Song.new("Hurt")

    @new_song = Song.new("La Bamba")

    @playlist = [@song_1, @song_2, @song_3]

    @guest_1 = Guest.new("Wilston", 3)
    @guest_2 = Guest.new("Benito", 5)


    @room_1 = Room.new("Lucky Voice")

  end

  def test_get_room_name
      assert_equal("Lucky Voice", @room_1.name)
  end

  def test_get_playlist
    assert_equal([], @room_1.songs)
  end

  def test_get_guests
    assert_equal([], @room_1.guests)
  end

  def test_check_in
    @room_1.check_in(@guest_1)
    assert_equal([@guest_1], @room_1.guests)
  end

  def test_check_out_people
    @room_1.check_in(@guest_1)
    @room_1.check_out
    assert_equal([],@room_1.guests)
  end

  def test_add_playlist_to_room
    @room_1.add_playlist_to_room(@playlist)
    assert_equal(3, @room_1.songs.length)
  end

  def test_add_song_to_room
    @room_1.add_song_to_room(@new_song)
    assert_equal(1, @room_1.songs.length)
  end


end
