class Train
  attr_reader :number

  def initialize(number)
    @number = number

    @speed = 0
  end

  def get_current_speed
    puts "Train \"#{@number}\" current speed #{@speed}"
  end

  def add_route(route)
    @route = route
    @current_station = 0
    @route.stations[@current_station].add_train(self)
  end

  def get_current_station
    next_stations = ''
    prev_stations = ''

    if @route.stations.size == 2

      @route.stations.each do  |station|
        if station != @route.stations[@current_station]
          next_stations = station.title
          prev_stations = station.title
        end
      end

    elsif @current_station == @route.stations.size - 1

      next_stations = @route.stations[0].title
      prev_stations = @route.stations[@current_station - 1].title

    elsif @current_station == - @route.stations.size - 1

      next_stations = @route.stations[@current_station - 1].title
      prev_stations = @route.stations[0].title

    else
      puts "@current_station #{@current_station}"
      next_stations = @route.stations[@current_station + 1].title
      prev_stations = @route.stations[@current_station - 1].title
    end

    puts "current_station #{@route.stations[@current_station].title}"
    puts "previous_station #{prev_stations}"
    puts "next_station #{next_stations}"
  end

  def on_forvard
    if @route.nil?
      puts 'У поезда нет маршрута, назначте маршрут'
    else

      add_speed

      @route.stations[@current_station].trains.delete(self)

      @current_station == @route.stations.size - 1 ? @current_station = 0 : @current_station += 1

      @route.stations[@current_station].add_train(self)

      stop
    end
  end

  def on_back
    if @route.nil?
      puts 'У поезда нет маршрута, назначте маршрут'
    else

      add_speed

      @route.stations[@current_station].trains.delete(self)

      @current_station == - (@route.stations.size - 1) ? @current_station = 0 : @current_station -= 1

      @route.stations[@current_station].add_train(self)

      stop
    end
  end

  protected

  attr_accessor :speed

  def add_speed
    @speed += 50
    puts "Train \"#{@number}\" added speed by 50, current speed #{@speed}"
  end

  def stop
    @speed = 0
    puts "Train \"#{@number}\" stopped"
  end
end