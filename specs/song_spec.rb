require("minitest/autorun")
require('minitest/rg')
require_relative("../song")

class SongTest < MiniTest::Test

  def setup
    @song = Song.new("Iris")
  end

  def test_get_name
    assert_equal("Iris", @song.title)
  end


end
