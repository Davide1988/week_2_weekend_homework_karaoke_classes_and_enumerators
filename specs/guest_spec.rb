require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")

class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Wilston", 3)
  end

  def test_get_name
    assert_equal("Wilston", @guest.guest_name)
  end

  def test_get_wallet_value
    assert_equal(3 , @guest.wallet)
  end 





end
