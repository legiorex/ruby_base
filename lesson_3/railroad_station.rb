class Station
  attr_accessor :trains, :title

  def initialize(title)
    @title = title
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def send_train
    current_train = @trains.pop

    puts "Train \"#{current_train.train[:number]}\" from the station #{@title} out" if current_train
    current_train.on_forvard if current_train
  end

  def count_trains
    puts "On stantion \"#{@title}\" #{@trains.size}"
  end

  def get_count_type_trains
    count_pass = @trains.count { |item| item.train[:type] == 'pass' }
    count_cargo = @trains.count { |item| item.train[:type] == 'cargo' }

    puts "count_pass: #{count_pass}, count_cargo: #{count_cargo}"
  end
end

class Route
  attr_accessor :stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station

    @stations = [@start_station, @end_station]
  end

  def get_stations
    @stations.each { |station| puts station.title }
  end

  def add_station(station)
    @stations.insert(1, station)
  end

  def delete_station
    @stations.slice!(1) if @stations.length > 2
  end
end

class Train
  attr_accessor :train
  attr_reader :speed

  def initialize(number, type, count_wagons)
    @train = {
      number: number,
      type: type,
      count_wagons: count_wagons
    }
    @speed = 0
    @route = nil
  end

  def add_speed
    @speed += 50
    puts "Train \"#{@train[:number]}\" added speed by 50, current speed #{@speed}"
  end

  def stop
    @speed = 0
    puts "Train \"#{@train[:number]}\" stopped"
  end

  def speed
    puts "Train \"#{@train[:number]}\" current speed #{@speed}"
  end

  def get_wagons
    puts "Train \"#{@train[:number]}\" has #{@train[:count_wagons]} wagons"
  end

  def add_wagon
    @train[:count_wagons] += 1 if @speed.zero?
  end

  def delete_wagon
    @train[:count_wagons] -= 1 if @speed.zero? && @train[:count_wagons] > 1
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
        if station.object_id != @route.stations[@current_station].object_id
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
    add_speed

    @route.stations[@current_station].trains.delete(self)

    @current_station == @route.stations.size - 1 ? @current_station = 0 : @current_station += 1

    @route.stations[@current_station].add_train(self)

    stop
  end

  def on_back
    add_speed

    @route.stations[@current_station].trains.delete(self)

    @current_station == - (@route.stations.size - 1) ? @current_station = 0 : @current_station -= 1

    @route.stations[@current_station].add_train(self)

    stop
  end
end

moskov = Station.new('moskov')
piter = Station.new('piter')
sochi = Station.new('sochi')
vladivostok = Station.new('vladivostok')

magic_route = Route.new(moskov, piter)
magic_route.add_station(sochi)

super_train = Train.new('Korgy', 'pass', 5)
dog_train = Train.new('Dogs', 'cargo', 5)
cat_train = Train.new('Cats', 'cargo', 5)

super_train.add_route(magic_route)
dog_train.add_route(magic_route)
cat_train.add_route(magic_route)

moskov.count_trains
moskov.get_count_type_trains
