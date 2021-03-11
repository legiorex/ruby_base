class PassengerTrain < Train
  attr_reader :type

  def initialize(number)
    @number = number
    @type = 'passenger'
    super(number)
  end

  def add_wagon(wagon)
    if wagon.type
      @wagons << wagon
    else
      puts 'Вы можете добавить только пассажирский вагон'
    end
  end

  def delete_wagon
    if @wagons.empty?
      puts 'У поезда нет вагонов'
    else
      @wagons.shift
    end
  end

  def print_wagons
    each_wagon do |wagon|
      puts "тип вагона #{wagon.type} занятых мест #{wagon.occupied_items} свободных мест #{wagon.free_items}"
    end
  end
end
