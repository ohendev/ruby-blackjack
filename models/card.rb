class Card
  def initialize(suit, name)
      @suit = suit
      @name = name
      @value = attributing_value_by_name(name)
      @ace = is_an_ace?(@value)
  end

  def attributing_value_by_name(name)
    value = 0
    if name.match?('\d+')
      value = name.to_i
    else
      if name.start_with?("K") || name.start_with?("Q") || name.start_with?("J")
        value = 10
      else
        value = 11
      end
    end
    return value
  end

  def is_an_ace?(value)
    return value == 11
  end

  def print_name(player)
    puts "#{player.name} has drawn: " + self.name + " of " + self.suit
  end

  def name
    return @name
  end

  def suit
    return @suit
  end

  def value
    return @value
  end

  def ace
    return @ace
  end

end
