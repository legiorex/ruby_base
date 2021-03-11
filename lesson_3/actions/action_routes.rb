require_relative 'action'

class ActionRoutes < Action
  def initialize(rail_road_station)
    @rail_road_station = rail_road_station
    @routes = rail_road_station.routes
    @stations = rail_road_station.stations
    super(rail_road_station)
  end

  def control
    select_action = %i[on_main_menu create_route delete_route delete_station add_station]
    loop do
      puts '1 -- создать маршрут'
      puts '2 -- удалить маршрут'
      puts '3 -- удалить станцию'
      puts '4 -- добавить станцию'
      puts '0 -- вернутся в главное меню'

      @choise_route = gets.chomp.to_i
      send(select_action[@choise_route])

      break if @choise_route.zero?
    end
  end

  private

  def on_main_menu
    @choise_route = 0
  end

  def create_route
    if @stations.length < 2
      puts 'У вас недостаточно станций для создания маршрута, необходимо две и более станций'
      @choise_route = 0

    else
      puts 'Выберите начальную станцию'
      @stations.each_with_index do |item, index|
        puts "#{index} - выбрать эту станцию #{item.title}"
      end

      puts 'Введите номер станции'
      first_station = gets.chomp.to_i

      puts 'Выберите конечную станцию'
      @stations.each_with_index do |item, index|
        puts "#{index} - выбрать эту станцию #{item.title}" if first_station != index
      end

      puts 'Введите номер станции'
      second_station = gets.chomp.to_i

      route = Route.new(@stations[first_station], @stations[second_station])

      @routes << route
      @routes.each(&:all_stations)
    end
  end

  def delete_route
    @routes.delete_at(select_route_index)
  end

  def delete_station
    select_stations = select_route.stations

    puts 'Выберите станцию для удаления'

    select_stations.each_with_index do |item, index|
      puts "#{index} --- станция #{item.title}" if !index.zero? && index != @stations.length - 1
    end

    select_station_index = gets.chomp.to_i
    select_stations.delete_at(select_station_index)
  end

  def add_station
    selected_route = select_route
    free_stations = @stations - selected_route.stations

    puts 'Выберите станцию'

    if free_stations.empty?
      puts 'Все станции есть в маршруте'
    else
      free_stations.each_with_index do |item, index|
        puts "#{index} --- станция #{item.title}"
      end
      select_station_index = gets.chomp.to_i
      selected_route.add_station(free_stations[select_station_index])
    end
  end
end
