require("minitest/autorun")
require('minitest/rg')
require_relative("../room_service")
require_relative("../room")
require_relative('../guest')
require_relative("../drink")


class RoomServiceTest < MiniTest::Test

  def setup

    @gret_room_service = RoomService.new()


  end



end
