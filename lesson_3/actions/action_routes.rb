require_relative 'action'

class ActionRoutes < Action
  def initialize(rail_road_station)
    @rail_road_station = rail_road_station
    @routes = rail_road_station.routes
    @stations = rail_road_station.stations
    super(rail_road_station)
  end

  def control
    loop do
      puts '1 -- создать маршрут'
      puts '2 -- удалить маршрут'
      puts '3 -- удалить станцию'
      puts '4 -- добавить станцию'
      puts '0 -- вернутся в главное меню'

      @choise_route = gets.chomp.to_i

      case @choise_route
      when 1
        create_route

      when 2

        @routes.delete_at(select_route_index)

      when 3

        delete_station

      when 4
        add_station

      when 0
        @choise_route = 0
      end
      break if @choise_route == 0
    end
  end

  private

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
      @routes.each { |item| item.get_stations }
    end
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
