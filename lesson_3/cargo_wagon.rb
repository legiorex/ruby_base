class CargoWagon < Wagon
  attr_reader :type

  def initialize
    @type = 'cargo'
    super
  end
end
