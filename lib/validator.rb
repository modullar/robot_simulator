module Validator

  def check_positive_integer(number)
    return if number.is_a?(Integer) && number >= 0
    raise ArgumentError, "coordination #{number}is not integer"
  end

end
