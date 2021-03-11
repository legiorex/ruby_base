require './modules/instance_counter'
require './actions/action_routes'
require './actions/action_trains'
require './actions/action_stations'
require './actions/action_wagons'
require_relative 'rail_road_station'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

class Main
  def initialize
    puts 'Привет, это программа-абстракция железной дороги'

    rail_road_station = RailRoadStations.new
    rail_road_station.seed
    @actions_route = ActionRoutes.new(rail_road_station)
    @actions_trains = ActionTrains.new(rail_road_station)
    @actions_wagons = ActionWagons.new(rail_road_station)
    @action_stations = ActionStations.new(rail_road_station)
  end

  def control
    select_action = { 1 => @action_stations, 2 => @actions_route, 3 => @actions_trains, 4 => @actions_wagons }

    loop do
      puts '1 - управление станциями'
      puts '2 - управление маршрутами'
      puts '3 - управление поездами'
      puts '4 - управление вагонами'
      puts '0 - выход из программы'
      choise = gets.chomp.to_i

      select_action[choise]&.control

      break if ['exit', 0].include?(choise)
    end
  end
end

main = Main.new

main.control
