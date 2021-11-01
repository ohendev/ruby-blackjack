require './deck/DeckBuilder'
require './game/Game'
require './models/Player'

play_again = true
while play_again
  #set up phase
  game = Game.new
  deck = game.deck
  game.new_table
  dealer = Player.new("Dealer", 1000000)
  player = game.player
  #bet round portion
  round_bet = game.bet_amount(player)
  #draw cards portion
  player.points = game.draw_a_card(deck, player)
  player.points += game.draw_a_card(deck, player)
  puts "Dealer to play:"
  dealer.points = game.draw_a_card(deck, dealer)
  dealer.points += game.draw_a_card(deck, dealer)
  #player hit or not portion
  another_card = true
  while player.points < 21 && another_card
    another_card = game.hit?(player, dealer)
    if another_card
      player.points += game.draw_a_card(deck, player)
    end
    #manage ace
    if player.points > 21
      for card in player.cards
        if card.ace
          player.points -= 10
        end
      end
    end
  end
  #dealer hit or not portion
  while dealer.points < 17 && player.points < 21
    dealer.draw_a_card(deck, dealer)
    #manage ace
    if dealer.points > 21
      for card in dealer.cards
        if card.ace
          dealer_cards -= 10
        end
      end
    end
  end
  #win condition checks
  puts "========== who has won ? ==========="
  gain_or_loss = game.win_check(player, dealer, round_bet)
  player.chips += gain_or_loss
  dealer.chips -= gain_or_loss
  play_again = game.play_again?(player)
  #resetting phase
  player.reset_cards
  player.reset_points
  dealer.reset_cards
  dealer.reset_points
  game = nil
  deck = nil
end
puts "Thank you! bye!"
