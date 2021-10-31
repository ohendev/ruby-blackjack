class DeckBuilder
  @@suites
  @@names
    def initialize
      @@suites = ["Hearts", "Spades", "Clubs", "Diamonds"]
      @@names =  ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
    end

    def build
      deck = []
      for i in (0..12)
        for j in (0..3)
          card = Card.new (@@suites[j], @@names[i])
          deck.push(card)
        end
      end
      return deck
    end

    def shuffle_deck(deck)
      return deck.shuffle
    end
end
