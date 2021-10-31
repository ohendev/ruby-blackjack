class Card
  def initialize(suit, name, value, ace)
      @suit = suit
      @name = name
      @value = attributing_value_by_name(name)
      @ace = ace
  end

  def attributing_value_by_name(name)
    value = 0
    if name.match?('\d+')
      value = name.to_i :
    else
      if name.start_with?("K") || name.start_with?("Q") || name.start_with?("J")
        value = 10
      else
        value = 11
      end
    end
    return value
  end


end
