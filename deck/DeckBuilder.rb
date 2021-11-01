require '././models/Card'
class DeckBuilder
  @@suites
  @@names
  @@deck
    def initialize
      @@suites = ["Hearts", "Spades", "Clubs", "Diamonds"]
      @@names =  ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
      @@deck = []
    end

    def build

      for i in (0..12)
        for j in (0..3)
          card = Card.new(@@suites[j], @@names[i])
          @@deck.push(card)
        end
      end
      return @@deck
    end

    def draw
      return @@deck.pop
    end
end
