module InstanceCounter
  @@station_count = 0
  @@passenger_train_count = 0
  @@cargo_train_count = 0
  @@routes_count = 0

  module ClassMethods
    include InstanceCounter

    def instances
      puts "Количество станций #{@@station_count}" if self == Station

      puts "Количество пассажирских поездов #{@@passenger_train_count}" if self == PassengerTrain

      puts "Количество грузовых поездов #{@@cargo_train_count}" if self == CargoTrain

      puts "Количество маршрутов #{@@routes_count}" if self == Route
    end
  end

  module InstanseMethods
    include InstanceCounter

    def register_instance(current_class)
      case current_class
      when Station
        @@station_count += 1

      when Route
        @@routes_count += 1

      when PassengerTrain
        @@passenger_train_count += 1

      when CargoTrain
        @@cargo_train_count += 1

      end
    end
  end

  private

  attr_accessor :station_count, :passenger_train_count, :cargo_train_count, :routes_count
end
