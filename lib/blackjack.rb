
require_relative "card"
require_relative "deck"
require_relative "hand"
require 'pry'

deck = Deck.new
puts "Dealer shuffles deck"
puts ""
# As a dealer
# I want to initially deal out two cards to the current player
# So that we can begin the game

player_hand = Hand.new(deck.deal(2))
dealer_hand = Hand.new(deck.deal(2))

puts "Dealer shows:"
puts dealer_hand.cards[0].summary

puts ""
puts "Player is dealt:"

player_hand.cards.each do |card|
  puts card.summary
end

# As a player
# I want to know my current best possible score
# So that I can decide whether to hit or stand
puts "\nPlayer has #{player_hand.score}"


# As a player
# I want to be prompted to hit or stand
# So that I know when I have to act
answer = ""
while player_hand.score < 22 && answer != 'S'

  print "Hit or stand (H/S): "
  answer = gets.chomp.upcase

  while answer != 'H' && answer != 'S'
    print "I don't understand. Hit or stand (H/S): "
    answer = gets.chomp.upcase
  end

  if answer == 'H'
    puts "You hit!"
    player_hand.cards << deck.draw
    puts "#{player_hand.cards.last.summary} added to Player's Hand."
    puts "Player has #{player_hand.score}"
  elsif answer == 'S'
    puts "You stand."
  end
end

if player_hand.score > 21
  puts ""
  puts "Bust! Game over."
end
















puts ""
puts "the end"
