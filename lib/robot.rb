require 'forwardable'
require 'irb'

class Robot
  extend Forwardable

  attr_accessor :position, :table

  def_delegator :@position, :turn_right
  def_delegator :@position, :turn_left

  def initialize(table)
    @table = table
    @position = nil
  end

  def place(position)
    @position = position if @table.in_boundaries?(position)
  end

  def move
    return unless placed?
    new_position = Position.new(@position.x, @position.y, @position.face)
    new_position.shift
    @position = new_position if table.in_boundaries?(new_position)
  end

  def report
    if !placed?
      'not placed yet'
    else
      [@position.x, @position.y, @position.face].join(',')
    end
  end

  def placed?
    !@position.nil?
  end

  private

end
