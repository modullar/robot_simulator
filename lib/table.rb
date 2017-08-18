require 'validator'

class Table

  include Validator

  def initialize(length, width)
    check_integer(length)
    check_integer(width)
    @length = length
    @width = width
  end

  def in_boundaries?(position)
    position.x < @length &&
    position.y < @width &&
    position.x >= 0 &&
    position.y >= 0
  end

end
