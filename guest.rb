class Guest

  attr_reader :guest_name
  attr_accessor :wallet

  def initialize(guest_name, wallet = 0)
    @guest_name = guest_name
    @wallet = wallet
  end





end
