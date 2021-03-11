class CargoWagon < Wagon
  attr_reader :type, :volume

  def initialize(volume)
    @volume = volume
    @type = 'cargo'

    super(volume)
  end

  def load_wagon(value)
    if free_items.zero?
      puts 'Нет свободного места, загрузите другой вагон'

    elsif value > volume
      puts 'Превышен лимит загрузки'

    else
      self.used_wagon(value)
    end
  end
end
