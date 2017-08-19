require 'validator'

class Table

  attr_accessor :length, :width

  include Validator

  def initialize(length, width)
    check_positive_integer(length)
    check_positive_integer(width)
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
