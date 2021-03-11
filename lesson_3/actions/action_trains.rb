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
    select_action = %i[on_main_menu create_train add_route on_forvard on_back add_wagon delete_wagon]
    loop do
      puts '1 -- создать поезд'
      puts '2 -- назначить маршрут'
      puts '3 -- вперёд'
      puts '4 -- назад'
      puts '5 -- прицепить вагон'
      puts '6 -- отцепить вагон'
      puts '0 -- в главное меню'

      @choise_train = gets.chomp.to_i
      send(select_action[@choise_train])

      break if @choise_train.zero?
    end
  end

  private

  def on_main_menu
    @choise_train = 0
  end

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

  def add_route
    selected_route = select_route
    select_train.add_route(selected_route)
  end

  def on_forvard
    select_train.on_forvard
  end

  def on_back
    select_train.on_back
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
