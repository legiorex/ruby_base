require_relative 'action'

class ActionTrains < Action
  def initialize(rail_road_station)
    @rail_road_station = rail_road_station
    @routes = rail_road_station.routes
    @stations = rail_road_station.stations
    @trains = rail_road_station.trains
    @wagons = rail_road_station.wagons
    super(rail_road_station)
  end

  def control
    loop do
      puts '1 -- создать поезд'
      puts '2 -- назначить маршрут'
      puts '3 -- вперёд'
      puts '4 -- назад'
      puts '5 -- создать вагон'
      puts '6 -- прицепить вагон'
      puts '7 -- отцепить вагон'
      puts '0 -- в главное меню'

      choise_train = gets.chomp.to_i

      case choise_train
      when 1

        create_train

      when 2

        selected_route = select_route

        select_train.add_route(selected_route)

      when 3
        select_train.on_forvard

      when 4
        select_train.on_back

      when 5

        create_wagon

      when 6
        add_wagon
      when 7
        delete_wagon
      when 0
        choise_route = 0

      end

      break if choise_train.zero?
    end
  end

  private

  def create_train
    puts 'Введите номер поезда, формата ххх-хх'

    train_name = gets.chomp

    puts 'Выберите тип поезда'
    puts '1 --- пассажирский поезд'
    puts '2 --- грузовой поезд'

    train_type = gets.chomp.to_i

    @trains << PassengerTrain.new(train_name) if train_type == 1
    @trains << CargoTrain.new(train_name) if train_type == 2

    @trains.each { |item| puts item.number }
  rescue StandardError => e
    puts e.message
  end

  def create_wagon
    puts 'Выберите тип вагона'
    puts '1 --- Пассажирский'
    puts '2 --- Грузовой'

    type_wagon = gets.chomp.to_i

    @wagons << PassengerWagon.new if type_wagon == 1
    @wagons << CargoWagon.new if type_wagon == 2
  end

  def add_wagon
    if @wagons.empty?
      puts 'Вагонов нет, создайте их'
    else

      seleted_train = select_train
      selected_wagon = select_wagon

      added_wagon = seleted_train.add_wagon(selected_wagon)

      @wagons.delete(selected_wagon) if added_wagon

    end
  end

  def delete_wagon
    seleted_train = select_train

    if seleted_train.wagons.empty?
      puts 'У поезда нет вагонов'
    else

      selected_wagon = seleted_train.wagons.shift

      @wagons << selected_wagon
    end
  end
end
