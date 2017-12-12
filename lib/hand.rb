require_relative 'deck'
require_relative 'card'

class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def hit(deck)
    @cards << deck.draw
  end

  def score
    total = 0
    @cards.each do |card|
      if card.value == 'A'
        total += 1
      elsif card.value == 'K' || card.value == 'Q' || card.value == 'J'
        total += 10
      else
        total += card.value.to_i
      end
    end
    return total
  end

  def ace_count
    aces = 0
    @cards.each do |card|
      if card.value == 'A'
        aces += 1
      end
    end
    return aces
  end
end
