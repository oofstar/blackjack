require_relative 'card'
require_relative 'hand'

SUITS = ['♠︎', '♣', '♥︎', '♦']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

class Deck
  attr_reader :collection

  def initialize
    @collection = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @collection << Card.new(suit, value)
      end
    end
    @collection.shuffle!
  end

  def deal(num)
    cards = []
    num.times do
      cards << @collection.shift
    end
    return cards
  end

  def draw
    @collection.shift
  end




end
