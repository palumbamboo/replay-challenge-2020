class Map

  attr_accessor :width, :height, :developers, :managers

  def initialize width, height
    @width      = width
    @height     = height
    @developers = []
    @managers   = []
  end

end