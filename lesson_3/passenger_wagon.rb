class PassengerWagon < Wagon
  attr_reader :type, :place_count

  def initialize(place_count)
    @type = 'passenger'
    super(place_count)
  end

  def take_place
    if free_items.zero?
      puts 'Нет свободного места, пройдите в другой вагон'
    else
      self.used_wagon(1)
    end
  end
end
