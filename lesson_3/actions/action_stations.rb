require_relative 'action'

class ActionStations < Action
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
      puts '1 -- создать станцию'
      puts '2 -- посмотреть список станций'
      puts '3 -- посмотреть список поездов на станции'
      puts '0 -- вернуться в главное меню'

      choise_station = gets.chomp.to_i

      case choise_station
      when 1
        create_station
      when 2
        select_station

      when 3
        list_trains_on_station

      when 0
        choise_station = 0

      end

      break if choise_station.zero?
    end
  end

  private

  def create_station
    puts 'Введите название станции'

    station_name = gets.chomp

    @stations << Station.new(station_name)
  end

  def list_trains_on_station
    puts 'Выберите станцию'
    select_station

    select_station_index = gets.chomp.to_i

    @stations[select_station_index].each_train do |train|
      puts "Номер поезда - #{train.number} тип поезда - #{train.type} количество вагонов - #{train.wagons.size}"

      train.each_wagons
    end
  end
end
