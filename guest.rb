class Guest

  attr_reader :guest_name, :fav_song
  attr_accessor :wallet

  def initialize(guest_name, wallet = 0,fav_song)
    @guest_name = guest_name
    @wallet = wallet
    @fav_song = fav_song
  end

  def can_customer_afford_fee(fee)
    if @wallet >= fee
       @wallet -= fee
       return true
     else
       return false
    end
  end

  def cheering(playlist)
    if playlist.find(@fav_song)
      return "WHOOOO MY SONG!!"
    end
  end



end
