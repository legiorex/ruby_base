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

    t_p = PassengerTrain.new('ппп-11')
    c_t = CargoTrain.new('ггг-22')

    w_c1 = CargoWagon.new(5)
    w_c2 = CargoWagon.new(12)
    w_c3 = CargoWagon.new(9)
    w_c4 = CargoWagon.new(15)
    w_c5 = CargoWagon.new(24)

    w_c1.take_volume
    w_c1.take_volume
    w_c1.take_volume
    w_c1.take_volume

    w_c4.take_volume
    w_c4.take_volume
    w_c4.take_volume
    w_c4.take_volume

    w_c5.take_volume
    w_c5.take_volume
    w_c5.take_volume
    w_c5.take_volume
    w_c5.take_volume
    w_c5.take_volume
    w_c5.take_volume
    w_c5.take_volume
    w_c5.take_volume

    @wagons << w_c1
    @wagons << w_c2
    @wagons << w_c3
    @wagons << w_c4
    @wagons << w_c5

    w_p1 = PassengerWagon.new(5)
    w_p2 = PassengerWagon.new(10)
    w_p3 = PassengerWagon.new(11)
    w_p4 = PassengerWagon.new(12)
    w_p5 = PassengerWagon.new(13)

    w_p1.take_place
    w_p1.take_place
    w_p1.take_place

    w_p3.take_place
    w_p3.take_place
    w_p3.take_place
    w_p3.take_place
    w_p3.take_place

    w_p5.take_place
    w_p5.take_place
    w_p5.take_place
    w_p5.take_place
    w_p5.take_place
    w_p5.take_place
    w_p5.take_place
    w_p5.take_place
    w_p5.take_place

    @wagons << w_p1
    @wagons << w_p2
    @wagons << w_p3
    @wagons << w_p4
    @wagons << w_p5

    t_p.add_route(routes1)
    t_p.add_wagon(w_p1)
    t_p.add_wagon(w_p2)
    t_p.add_wagon(w_p3)
    t_p.add_wagon(w_p4)
    t_p.add_wagon(w_p5)

    c_t.add_route(routes1)
    c_t.add_wagon(w_c1)
    c_t.add_wagon(w_c2)
    c_t.add_wagon(w_c3)
    c_t.add_wagon(w_c4)
    c_t.add_wagon(w_c5)
    @trains << t_p
    @trains << c_t
  end
end
