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

      choise_route = gets.chomp.to_i

      case choise_route
      when 1

        if @stations.length < 2
          puts 'У вас недостаточно станций для создания маршрута, необходимо две и более станций'
          break

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

      when 2
        select_route

        select_route_index = gets.chomp.to_i

        @routes.delete_at(select_route_index)

      when 3
        select_route

        select_route_index = gets.chomp.to_i

        select_stations = @routes[select_route_index].stations

        puts 'Выберите станцию для удаления'

        select_stations.each_with_index do |item, index|
          puts "#{index} --- станция #{item.title}" if !index.zero? && index != @stations.length - 1
        end

        select_station_index = gets.chomp.to_i

        select_stations.delete_at(select_station_index)

      when 4
        select_route

        select_route_index = gets.chomp.to_i

        stations_in_selected_route = @routes[select_route_index].stations

        free_stations = @stations - stations_in_selected_route

        puts 'Выберите станцию'

        free_stations.each_with_index do |item, index|
          puts "#{index} --- станция #{item.title}" if first_station != index
        end
        select_station_index = gets.chomp.to_i

        @routes[select_route_index].add_station(free_stations[select_station_index])

      when 0
        choise_route = 0
      end
      break if choise_route == 0
    end
  end
end
