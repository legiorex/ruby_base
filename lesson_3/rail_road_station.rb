class RailRoadStations
  attr_accessor :trains, :routes, :stations, :wagons

  def initialize
    @trains = []
    @routes = []
    @stations = []
    @wagons = []
  end

  def seed
    moskov = Station.new('moskov')
    piter = Station.new('piter')
    sochi = Station.new('sochi')
    vladivostok = Station.new('vladivostok')

    @stations = [moskov, piter, sochi, vladivostok]

    routes1 = Route.new(moskov, piter)
    routes1.add_station(sochi)
    routes1.add_station(vladivostok)
    routes2 = Route.new(sochi, vladivostok)
    @routes << routes1
    @routes << routes2

    train_pass = PassengerTrain.new('Пассажирский поезд А')
    train_pass2 = PassengerTrain.new('Пассажирский поезд А')
    train_pass3 = PassengerTrain.new('Пассажирский поезд А')
    cargo_train = CargoTrain.new('Грузовой поезд Б')

    wagon_cargo = CargoWagon.new

    wagon_pass = PassengerWagon.new

    @wagons << wagon_cargo
    @wagons << wagon_pass

    train_pass.add_route(routes1)
    train_pass2.add_route(routes1)
    train_pass3.add_route(routes1)
    cargo_train.add_route(routes1)
    @trains << train_pass
    @trains << cargo_train
  end
end
