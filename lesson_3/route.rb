class Route
  include InstanceCounter
  attr_accessor :stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [@start_station, @end_station]
    self.register_instance
  end

  def all_stations
    @stations.each_with_index do |station, index|
      is_first_index = index.zero?
      is_last_index = index == @stations.length - 1
      puts "#{index} Начальная станция #{station.title}" if is_first_index
      puts "#{index}  #{station.title}" if !is_first_index && !is_last_index
      puts "#{index} Конечная станция #{station.title}" if is_last_index
    end
  end

  def add_station(station)
    @stations.insert(1, station)
  end

  def delete_station
    @stations.slice!(1) if @stations.length > 2
  end
end
