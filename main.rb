deck = DeckBuilder.new
deck.build!
deck.shuffle_deck!
game = Game.new (deck)
game.new_table
dealer = Player.new ("Dealer", 1000000)
player = game.player
play_again = true
while play_again
  #bet round portion
  round_bet = game.bet_amount(player)
  #draw cards portions
  player_points = game.draw_a_card(deck, player)
  player_points += game.draw_a_card(deck, player)
  puts "Dealer to play:"
  dealer_points = game.draw_a_card(deck, dealer)
  dealer_points += game.draw_a_card(deck, dealer)
  #player hit or not portion
  another_card = true
  while player.points < 21 && another_card
    another_card = game.hit?(player)
    if another_card
      player_points += game.draw_a_card(deck, player)
    end
    player_cards = player.cards
    if player.points > 21
      for card in player_cards
        if card.is_an_ace?
          player_points -= 10
        end
      end
    end
  end
  #dealer hit or not portion
  while dealer.points < 17 && player.points < 21
    dealer_cards = dealer.cards
    if dealer.points > 21
      for card in dealer_cards
        if card.is_an_ace?
          dealer_cards -= 10
        end
      end
    end
  end
  #win condition checks
  puts "========== who has won ? ==========="
  player.chips += game.win_check(player, dealer, round_bet)
  play_again = game.play_again?(player)
end
