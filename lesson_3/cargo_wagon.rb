class CargoWagon < Wagon
  attr_reader :type, :volume, :free_volume, :occupied_volume

  def initialize(volume)
    @type = 'cargo'
    @volume = volume
    @free_volume = volume
    @occupied_volume = 0
    super()
  end

  def take_volume
    if @free_volume != 0
      @occupied_volume += 1
      @free_volume -= 1
    end
  end
end
