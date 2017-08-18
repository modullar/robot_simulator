class Position
  attr_reader :x, :y, :face

  FACES = %w(NORTH EAST SOUTH WEST).freeze

  def initialize(x, y, face)
    @x = x
    @y = y
    @face = face
  end

  def move
  end

  def turn(direction)
    @face = direction
  end
  
end
