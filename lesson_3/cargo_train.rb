class CargoTrain < Train
  attr_reader :type, :wagons

  def initialize(number)
    @number = number
    @type = 'cargo'
    super(number)
  end

  def add_wagon(wagon)
    if wagon.type != @type
      puts 'Вы можете добавить только грузовой вагон'
    else

      @wagons << wagon
    end
  end

  def delete_wagon
    if @wagons.size.zero?
      puts 'У поезда нет вагонов'
    else

      @wagons.shift
    end
  end
end
