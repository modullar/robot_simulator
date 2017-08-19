module Validator

  def check_positive_integer(number)
    return true if check_integer(number) && number >= 0
    raise ArgumentError, "coordination #{number} is not a positive integer"
  end

  def check_integer(number)
    return true if number.is_a?(Integer)
    raise ArgumentError, "coordination #{number} is not an integer"
  end

end
