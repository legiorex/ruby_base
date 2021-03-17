class Station
  include InstanceCounter

  attr_accessor :trains, :title

  def all
    @stations
  end

  def initialize(title)
    @title = title
    @trains = []
    @stations = []
    @stations << self
    self.register_instance
  end

  def add_train(train)
    @trains << train
  end

  def send_train
    current_train = @trains.pop
    puts "Поезд \"#{current_train.number}\" отправился из станции #{@title}" if current_train
    current_train&.on_forvard
  end

  def count_trains
    puts "On stantion \"#{@title}\" #{@trains.size}"
  end

  def count_type_trains
    count_pass = @trains.count { |item| item.type == 'passenger' }
    count_cargo = @trains.count { |item| item.type == 'cargo' }
    puts "Колличество поездов --- пассажирских: #{count_pass}, грузовых: #{count_cargo}"
  end

  def each_train(&block)
    @trains.each(&block)
  end
end
