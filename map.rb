class Map

  attr_accessor :width, :height, :developers, :managers, :floor_map, :dev_size, :man_size, :file_name

  def initialize width, height, file_name
    @width        = width
    @height       = height
    @floor_map    = []
    @developers   = []
    @managers     = []
    @file_name    = file_name
  end

end