require 'validator'

class Position
  include Validator

  attr_reader :x, :y, :face

  FACES = %w(NORTH EAST SOUTH WEST).freeze

  def initialize(x, y, face)
    check_input(x,y,face)
    @x = x
    @y = y
    @face = face.upcase
  end

  def x=(x)
    check_integer(x)
    @x = x
  end

  def y=(y)
    check_integer(y)
    @y = y
  end

  def face=(face)
    check_face(face)
    @face = face.upcase
  end

  private

  def check_input(x,y,face)
    check_integer(x)
    check_integer(y)
    check_face(face)
  end

  def check_face(dir)
    dir = dir.upcase
    raise ArgumentError, "face is not in #{FACES}" unless FACES.include?(dir)
  end

end
