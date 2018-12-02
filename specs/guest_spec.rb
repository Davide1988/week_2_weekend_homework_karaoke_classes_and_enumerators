require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")
require_relative("../room")
require_relative("../song")
require_relative("../drink")

class GuestTest < MiniTest::Test

  def setup


    @guest_1 = Guest.new("Winston", 3, "Iris")
    @guest_2 = Guest.new("Benito", 5, "Foxy Lady")
    @guest_3 = Guest.new("Mike", 8, "Hurt")
    @guest_4 = Guest.new("Dave", 10, "Too much love will kill you")

    @song_1 = Song.new("Iris")
    @song_2 = Song.new("Wonderwall")
    @song_3 = Song.new("Hurt")
    @song_4 = Song.new("Too much love will kill you")


    @playlist = [@song_1, @song_2, @song_3, @song_4]

    @room_1 = Room.new("Lucky Voice", 4, 5)
    @room_2 = Room.new("Lucky Voice", 3, 9)

    @drink_1 = Drink.new("Corona", 5)
    @drink_2 = Drink.new("Malbec", 7)
    @drink_3 = Drink.new("Cubalibre", 8)
    @drink_4 = Drink.new("G&T", 8)
    @drink_5 = Drink.new("Tennets", 4)

    @drinks = [@drink_1, @drink_2, @drink_3, @drink_4, @drink_5]

  end

  def test_get_name
    assert_equal("Winston", @guest_1.guest_name)
  end

  def test_get_wallet_value
    assert_equal(3 , @guest_1.wallet)
  end

  def test_can_customer_afford_fee__yes
    assert_equal(true , @guest_4.can_customer_afford_fee(@room_1.entry_fee) )
  end

  def test_can_customer_afford_fee__no
    assert_equal(false, @guest_3.can_customer_afford_fee(@room_2.entry_fee))
  end

  def test_cheerig
    @room_1.add_playlist_to_room(@playlist)
    assert_equal("WHOOOO MY SONG!!", @guest_4.cheering(@room_1.songs))
  end

  def test_customer_buy_drink__can_afford
    @guest_2.customer_buy_drink(@drink_1)
    assert_equal(0, @guest_2.wallet)
  end

  def test_customer_buy_drink__can_afford
    @guest_1.customer_buy_drink(@drink_1)
    assert_equal(3, @guest_1.wallet)
  end



end
