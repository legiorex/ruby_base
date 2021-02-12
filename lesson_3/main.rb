require_relative 'rail_road_station'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require './actions/action_routes'
require './actions/action_trains'
require './actions/action_stations'

class Main
  def initialize
    puts 'Привет, это программа-абстракция железной дороги'

    rail_road_station = RailRoadStations.new
    rail_road_station.seed
    @routes = rail_road_station.routes
    @stations = rail_road_station.stations
    @actions_route = ActionRoutes.new(rail_road_station)
    @actions_trains = ActionTrains.new(rail_road_station)
    @action_stations = ActionStations.new(rail_road_station)
  end

  def control
    loop do
      puts '1 - управление станциями'
      puts '2 - управление маршрутами'
      puts '3 - управление поездами'
      puts '0 - выход из программы'
      choise = gets.chomp.to_i

      case choise

      when 1
        @action_stations.control
      when 2
        @actions_route.control

      when 3
        @actions_trains.control

      else
        choise = 'exit'
      end

      break if choise == 'exit'
    end
  end
end

main = Main.new

main.control
