class Player

  def initialise(name, chips)
    @name = name
    @chips = chips
    @cards = []
    @points = 0
  end

  def add_card(card)
    @cards.push(card)
    @points += card.value
  end
end
