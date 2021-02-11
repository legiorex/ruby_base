class Action
  def initialize(rail_road_station)
    @rail_road_station = rail_road_station
    @routes = rail_road_station.routes
    @stations = rail_road_station.stations
    @trains = rail_road_station.trains
    @wagons = rail_road_station.wagons
  end

  def select_route
    puts 'Выберите маршрут'

    @routes.each_with_index { |item, index| puts "#{index} --- маршрут #{item.stations.first.title} - #{item.stations.last.title}" }
  end

  def select_train
    puts 'Выберите поезд'

    @trains.each_with_index { |item, index| puts "#{index} --- поезд #{item.number}" }
  end

  def select_wagon
    puts 'Выберите вагон'

    @wagons.each_with_index { |item, index| puts "#{index} --- вагон типа #{item.type}" }
  end

  def select_station
    @stations.each_with_index { |item, index| puts "#{index} --- станция #{item.title}" }
  end
end
