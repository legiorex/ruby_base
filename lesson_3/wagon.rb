class Wagon
  include Company

  attr_reader :items, :occupied_items

  def initialize(items)
    @items = items
    @occupied_items = 0
  end

  def used_wagon(value)
    @occupied_items += value if free_items != 0
  end

  def free_items
    @items - @occupied_items
  end
end
