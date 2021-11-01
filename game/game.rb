class Game

  def initialize(deck = DeckBuilder.new)
    @deck = deck
    @player = nil
  end

  def new_table
    puts "Welcome to our Blackjack table!"
    puts "what's your name buddy?"
    name = gets.chomp
    puts "Cool! #{name}, how many chips do you want?"
    chips = gets.chomp
    if chips.match?('\d+')
      chips = chips.to_i
    else
      chips = 1500
    end
    @player = Player.new(name, chips)
    puts "OK #{@player.name} you got #{@player.chips}"
    puts "Dealer shuffles deck!"
    @deck = @deck.build
    @deck.shuffle!
  end

  def draw_a_card(deck, player)
    puts "Dealer draw a card for #{player.name}"
    card = deck.draw
    card.print_name(player)
    player.add_card(card)
  end

  def win_check(player, dealer, bet)
    gain_or_loss = 0
    if player.points == 21 && dealer.points != 21
      puts "#{player.name}, you got 21! It's a Blackjack! You win!"
      gain_or_loss = 2 * bet
    elsif player.points > 21
      puts "#{player.name}, you got more tha 21! You bust!"
      gain_or_loss = -1 * bet
    elsif player.points == dealer.points
      puts "It's a push!"
    elsif dealer.points > 1
      puts "Dealer bust! You win!"
      gain_or_loss = 2 * bet
    elsif player.points < dealer.points
      puts "Dealer win!"
      gain_or_loss = -1 * bet
    else
      puts "You have more points! You win!"
      gain_or_loss = 2 * bet
    end
    return gain_or_loss
  end

  def bet_amount(player)
    answer = "9"
    until answer.match?('\d+') && answer.to_i > 10 && answer.to_i < player.chips
      puts "How much do you want to bet?"
      answer = gets.chomp
      if !answer.match?('\d+')
        puts "You have entered letters instead of numbers!"
      elsif answer.to_i < 10
        puts "You must bet at least 10 chips!"
      elsif answer.to_i > player.chips
        puts "You are trying to bet more chips than you have!"
        puts "You have: #{player.chips} chips!"
      end
    end
    amount = answer.to_i
    player.chips -= amount
    puts "Ok you have bet #{amount}"
    return amount
  end

  def hit?(player, dealer)
    puts "You have #{player.points} points in your cards."
    puts "Dealer has #{dealer.points} points."
    answer = ""
    yes = "Y"
    no = "N"
    until answer.start_with?(yes) || answer.start_with?(no)
      puts "Do you want to hit? (Y/N)"
      answer = gets.chomp
      answer.upcase!
    end
    if answer == yes
      return true
    else
      return false
    end
  end

  def play_again?(player)
    if player.chips <= 0
      return false
    end
    answer = ""
    yes = "Y"
    no = "N"
    until answer.match?(yes) || answer.match?(no)
      puts "You have #{player.chips} chips."
      puts "Do you want to play again? Y/N"
      answer = gets.chomp
      answer.upcase!
    end
    if answer.match?(no)
      return false
    else
      return true
    end
  end

  def player
    return @player
  end

  def deck
    return @deck
  end
end
