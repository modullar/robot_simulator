module Validator

  def check_integer(number)
    raise ArgumentError, "coordination #{number}is not integer" unless number.is_a? Integer
  end

end
