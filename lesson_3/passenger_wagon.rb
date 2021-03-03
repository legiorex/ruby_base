class PassengerWagon < Wagon
  attr_reader :type, :place_count, :free_place, :occupied_place

  def initialize(place_count)
    @type = 'passenger'
    @place_count = place_count
    @free_place = place_count
    @occupied_place = 0
    super()
  end

  def take_place
    if @free_place != 0
      @occupied_place += 1
      @free_place -= 1
    end
  end
end
