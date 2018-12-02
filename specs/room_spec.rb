require("minitest/autorun")
require('minitest/rg')
require_relative("../room")
require_relative('../guest')
require_relative('../song')
require_relative('../drink')

class RoomTest < MiniTest::Test

  def setup


    @song_1 = Song.new("Iris")
    @song_2 = Song.new("Wonderwall")
    @song_3 = Song.new("Hurt")
    @song_4 = Song.new("Too much love will kill you")

    @new_song = Song.new("La Bamba")

    @playlist = [@song_1, @song_2, @song_3, @song_4]

    @guest_1 = Guest.new("Winston", 3, "Iris")
    @guest_2 = Guest.new("Benito", 5, "Foxy Lady")
    @guest_3 = Guest.new("Mike", 8, "Hurt")
    @guest_4 = Guest.new("Dave", 10, "Too much love will kill you")

    @guests = [@guest_1, @guest_2, @guest_3, @guest_4]


    @room_1 = Room.new("Lucky Voice", 4, 5)
    @room_2 = Room.new("Lucky Voice", 3, 6)
    @room_3 = Room.new("The Voice", 10, 7)

    @drink_1 = Drink.new("Corona", 5)
    @drink_2 = Drink.new("Malbec", 7)
    @drink_3 = Drink.new("Cubalibre", 8)
    @drink_4 = Drink.new("G&T", 8)
    @drink_5 = Drink.new("Tennets", 4)

    @drinks = [@drink_1, @drink_2, @drink_3, @drink_4, @drink_5]

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

  def test_get_number_of_guest
    assert_equal(0, @room_1.guests.length)
  end

  def test_check_in__room_with_space__no_money
    @room_1.check_in(@guest_1)
    assert_equal([], @room_1.guests)
  end

  def test_check_in__room_with_space__and_money
    @room_1.check_in(@guest_4)
    assert_equal([@guest_4], @room_1.guests)
    assert_equal(5, @guest_4.wallet)
  end

  def test_check_in__room_with_space__and_no_money
    @room_1.check_in(@guest_1)
    assert_equal([], @room_1.guests)
    assert_equal(3, @guest_1.wallet)
  end


  def test_check_in__room_with_no_space
    room_1 = Room.new("Lucky Voice", 1 , 5)

    room_1.check_in(@guest_1)
    room_1.check_in(@guest_2)
    assert_equal(1, room_1.get_number_of_guest)
  end

  def test_check_out_people
    @room_1.check_in(@guest_1)
    @room_1.check_out
    assert_equal([],@room_1.guests)
  end

  def test_add_playlist_to_room
    @room_1.add_playlist_to_room(@playlist)
    assert_equal(4, @room_1.songs.length)
  end

  def test_add_song_to_room
    @room_1.add_song_to_room(@new_song)
    assert_equal(1, @room_1.songs.length)
  end

  def test_check_in_and_charge_group__room_1
    @room_1.check_in_group_and_charge(@guests)
    assert_equal(3, @guest_1.wallet)
    assert_equal(0, @guest_2.wallet)
    assert_equal(3, @guest_3.wallet)
    assert_equal(5, @guest_4.wallet)
    assert_equal(15,@room_1.bar_tab)
    assert_equal(3, @room_1.get_number_of_guest)
  end

  def test_check_in_and_charge_group__room_2
    @room_2.check_in_group_and_charge(@guests)
    assert_equal(3, @guest_1.wallet)
    assert_equal(5, @guest_2.wallet)
    assert_equal(8, @guest_3.wallet)
    assert_equal(10, @guest_4.wallet)
    assert_equal(0,@room_2.bar_tab)
    assert_equal(0, @room_2.get_number_of_guest)
  end

  def test_check_in_and_charge_group__room_3
    @room_3.check_in_group_and_charge(@guests)
    assert_equal(3, @guest_1.wallet)
    assert_equal(5, @guest_2.wallet)
    assert_equal(1, @guest_3.wallet)
    assert_equal(3, @guest_4.wallet)
    assert_equal(14,@room_3.bar_tab)
    assert_equal(2, @room_3.get_number_of_guest)
  end

  def test_check_in_group__too_big
    @room_2.check_in_group_and_charge(@guests)
    assert_equal(0, @room_2.get_number_of_guest)
    assert_equal(0, @room_2.bar_tab)
  end

  def test_get_bar_tab_money
    assert_equal(0, @room_1.bar_tab)
  end

  def test_add_drinks_to_room_fridge
    @room_1.add_drinks_to_room_fridge(@drinks)
    assert_equal(5, @room_1.fridge.count())
  end


  def test_customer_buy_drink_in_room
    @room_1.add_drinks_to_room_fridge(@drinks)
    @room_1.check_in_group_and_charge(@guests)
    @room_1.customer_buy_drink_in_room(@guest_4, @drink_1)
    assert_equal(3, @guest_1.wallet)
    assert_equal(0, @guest_2.wallet)
    assert_equal(3, @guest_3.wallet)
    assert_equal(0, @guest_4.wallet)
    assert_equal(20, @room_1.bar_tab)
  end





end
