class Station
  include InstanceCounter

  attr_accessor :trains, :title

  @@count_stations = 0

  def self.all
    @@count_stations
  end

  def initialize(title)
    @title = title
    @trains = []
    @@count_stations += 1
    register_instance
  end

  def add_train(train)
    @trains << train
  end

  def send_train
    current_train = @trains.pop

    puts "Поезд \"#{current_train.number}\" отправился из станции #{@title}" if current_train
    current_train.on_forvard if current_train
  end

  def count_trains
    puts "On stantion \"#{@title}\" #{@trains.size}"
  end

  def get_count_type_trains
    count_pass = @trains.count { |item| item.type == 'passenger' }
    count_cargo = @trains.count { |item| item.type == 'cargo' }

    puts "Колличество поездов --- пассажирских: #{count_pass}, грузовых: #{count_cargo}"
  end
end
