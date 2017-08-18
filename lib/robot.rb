class Robot

  attr_accessor :current_position, :table

  def initialize(table)
    @table = table
    @current_position = nil
  end

  def move
  end

  def place(x,y,z)
  end


  def left
  end

  def right
  end

  def report
    if !placed?
      'not in place'
    else
      [@current_position.x, @current_position.y, @current_position.direction].join(',')
    end
  end

  def placed?
    !@current_position.nil?
  end
end
