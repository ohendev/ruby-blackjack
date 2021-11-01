class Player

  def initialize(name, chips)
    @name = name
    @chips = chips
    @cards = []
    @points = 0
  end

  def add_card(card)
    @cards.push(card)
    @points += card.value
  end

  def name
    return @name
  end

  def chips
    return @chips
  end

  def chips=(amount)
    @chips += amount
  end

  def cards
    return @cards
  end

  def points
    return @points
  end

  def points=(amount)
    @points += amount
  end
end
