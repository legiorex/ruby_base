require_relative 'action'

class ActionWagons < Action
  def initialize(rail_road_station)
    @rail_road_station = rail_road_station
    @wagons = rail_road_station.wagons
    super(rail_road_station)
  end

  def control
    loop do
      puts '1 -- создать вагон'
      puts '2 -- занять место в пассажирском вагоне'
      puts '3 -- загрузить грузовой вагон'
      puts '0 -- в главное меню'

      choise_wagon = gets.chomp.to_i

      case choise_wagon
      when 1
        create_wagon
      when 2
        take_place
      when 3
        take_place

      when 0
        choise_wagon = 0

      end

      break if choise_wagon.zero?
    end
  end

  private

  def create_wagon
    puts 'Выберите тип вагона'
    puts '1 --- Пассажирский'
    puts '2 --- Грузовой'

    type_wagon = gets.chomp.to_i

    if type_wagon == 1
      puts 'Введите количество мест в пассажирском вагоне'
      count_place = gets.chomp.to_i

      @wagons << PassengerWagon.new(count_place)

    end

    if type_wagon == 2
      puts 'Введите объем грузового вагона'
      volume = gets.chomp.to_i

      @wagons << CargoWagon.new(volume)
    end
  end

  def sort_wagons_type(type, message)
    puts 'Выберите номер вагона'
    @wagons.each_with_index do |item, index|
      puts "Номер вагона - #{index} --- #{message} #{item.free_items}" if item.type === type
    end
    select_wagon_index = gets.chomp.to_i
    @wagons[select_wagon_index]
  end

  def take_place
    wagon = sort_wagons_type('passenger', 'свободных мест')
    wagon.take_place
  end

  def load_value
    wagon = sort_wagons_type('cargo', 'свободый объём')
    puts 'Введите необходимый объём для загрузки'
    value = gets.chomp.to_i

    wagon.load_wagon(value)
  end
end
