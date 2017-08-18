class Table

  def initialize(length, width)
    @length = length
    @width = width
  end

  # coordinates x and y can't be negative, and can't be larger than table size
  def in_boundaries?(position)
#    position.x < @length &&
#    position.y < @width &&
#    position.x >= 0 &&
#    position.y >= 0
  end

end
