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
    loop do
      puts '1 -- создать поезд'
      puts '2 -- назначить маршрут'
      puts '3 -- вперёд'
      puts '4 -- назад'
      puts '5 -- создать вагон'
      puts '6 -- прицепить вагон'
      puts '7 -- отцепить вагон'
      puts '0 -- в главное меню'

      choise_train = gets.chomp.to_i

      case choise_train
      when 1

        puts 'Введите название поезда'

        train_name = gets.chomp

        puts 'Выберите тип поезда'
        puts '1 --- пассажирский поезд'
        puts '2 --- грузовой поезд'

        train_type = gets.chomp.to_i

        @trains << PassengerTrain.new(train_name) if train_type == 1
        @trains << CargoTrain.new(train_name) if train_type == 2

        @trains.each { |item| puts item.number }

      when 2

        select_route
        select_route_index = gets.chomp.to_i

        select_train

        select_train_index = gets.chomp.to_i
        @trains[select_train_index].add_route(@routes[select_route_index])

      when 3
        select_train

        select_train_index = gets.chomp.to_i
        @trains[select_train_index].on_forvard

      when 4
        select_train

        select_train_index = gets.chomp.to_i
        @trains[select_train_index].on_back

      when 5

        puts 'Выберите тип вагона'
        puts '1 --- Пассажирский'
        puts '2 --- Грузовой'

        type_wagon = gets.chomp.to_i

        @wagons << PassengerWagon.new if type_wagon == 1
        @wagons << CargoWagon.new if type_wagon == 2

      when 6
        if @wagons.length.zero?
          puts 'Вагонов нет, создайте их'
        else
          select_train
          select_train_index = gets.chomp.to_i

          select_wagon
          select_wagon_index = gets.chomp.to_i

          @trains[select_train_index].add_wagon(@wagons[select_wagon_index])

        end
      when 7
        select_train
        select_train_index = gets.chomp.to_i

        if @trains[select_train_index].wagons.length.zero?
          puts 'У поезда нет вагонов'
        else

          @trains[select_train_index].wagons.shift
        end

      when 0
        choise_route = 0

      end

      break if choise_train.zero?
    end
  end
end
