class Map

  attr_accessor :width, :height, :developers, :managers, :floor_map

  def initialize width, height
    @width      = width
    @height     = height
    @floor_map  = []
    @developers = []
    @managers   = []
  end

end