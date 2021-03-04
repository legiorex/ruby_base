class CargoWagon < Wagon
  attr_reader :type, :volume

  def initialize(volume)
    @type = 'cargo'

    super(volume)
  end

  def load_wagon(value)
    self.used_wagon(value)
  end
end
