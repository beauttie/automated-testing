
# deck.rb

require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []

    [:hearts, :spades, :clubs, :diamonds].each do |suit|
      (1..13).each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end

  def draw
    # returns a card
    @cards.length > 0 ? ( return @cards.pop ) : ( raise NoMethodError.new("You have drawn all cards from the deck.") )
  end

  def shuffle
    # shuffles the deck
    @cards.shuffle
  end

  def count
    return @cards.length
  end
end
