class CargoTrain < Train
  attr_reader :type

  def initialize(number)
    @number = number
    @type = 'cargo'
    super(number)
  end

  def add_wagon(wagon)
    if wagon.type != @type
      puts 'Вы можете добавить только грузовой вагон'
    else
      self.wagons << wagon
    end
  end

  def delete_wagon
    if @wagons.empty?
      puts 'У поезда нет вагонов'
    else
      @wagons.shift
    end
  end

  def each_wagons
    self.each_wagon do |wagon|
      puts "тип вагона #{wagon.type} занятый объём #{wagon.occupied_volume} свободный объём #{wagon.free_volume}"
    end
  end
end
