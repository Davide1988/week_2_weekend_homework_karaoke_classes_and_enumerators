class Room

  attr_reader :name, :max_capacity, :entry_fee
  attr_accessor :guests, :songs, :bar_tab, :fridge

  def initialize(name , max_capacity, entry_fee, bar_tab = 0)
    @name = name
    @guests = []
    @songs = []
    @max_capacity = max_capacity
    @entry_fee = entry_fee
    @bar_tab = bar_tab
    @fridge = []
  end

  def check_in(guest)
    if @max_capacity > @guests.length && guest.can_customer_afford_fee(@entry_fee) == true
       @guests << guest
    end
  end

  def check_out
    @guests.clear
  end

  def get_number_of_guest
      return @guests.length
  end

  def add_playlist_to_room(playlist)
    @songs << playlist
    @songs = @songs.flatten
  end

  def add_song_to_room(song)
    @songs << song
  end

  def check_in_group_and_charge(guests)
    people_allowed_in = []
    fees = 0
    if @max_capacity >= guests.length
        people_allowed_in = guests.find_all {|guest| guest.can_customer_afford_fee(@entry_fee)}
        fees = people_allowed_in.length * @entry_fee
        @bar_tab += fees
        @guests << people_allowed_in
        @guests = @guests.flatten
    end
  end

  def add_drinks_to_room_fridge(drinks)
    @fridge << drinks
    @fridge = @fridge.flatten
  end

  def customer_buy_drink_in_room(guest,drink)
     if guest.wallet >= drink.price
        guest.wallet -= drink.price
        @bar_tab += drink.price
      else
        return guest.wallet
      end
  end




end
