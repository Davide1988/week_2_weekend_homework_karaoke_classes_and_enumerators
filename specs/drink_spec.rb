require("minitest/autorun")
require('minitest/rg')
require_relative("../drink")
require_relative("../room_service")
require_relative("../room")
require_relative('../guest')


class DrinkTest < MiniTest::Test

  def setup

    @drink_1 = Drink.new("Corona", 5)
    @drink_2 = Drink.new("Malbec", 7)
    @drink_3 = Drink.new("Cubalibre", 8)
    @drink_4 = Drink.new("G&T", 8)
    @drink_5 = Drink.new("Tennets", 4)

    @drinks = [@drink_1, @drink_2, @drink_3, @drink_4, @drink_5]


  end

  def test_get_drink_name
    assert_equal("Corona", @drink_1.drink_name)
  end



end
