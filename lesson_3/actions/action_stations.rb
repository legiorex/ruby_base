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
        puts 'Введите название станции'

        station_name = gets.chomp

        @stations << Station.new(station_name)
      when 2
        select_station

      when 3
        puts 'Выберите станцию'
        select_station

        select_station_index = gets.chomp.to_i

        @stations[select_station_index].get_count_type_trains

      when 0
        choise_station = 0

      end

      break if choise_station.zero?
    end
  end
end
