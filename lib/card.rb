
# card.rb

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    (1..13).include?(value) ? ( @value = value ) : ( raise ArgumentError.new("Invalid card value.") )

    [:hearts, :spades, :clubs, :diamonds].include?(suit) ? ( @suit = suit ) : ( raise ArgumentError.new("Invalid card suit.") )
  end

  def to_face(value)
    case value
    when 1
      return "Ace"
    when 11
      return "Jack"
    when 12
      return "Queen"
    when 13
      return "King"
    else
      return value
    end
  end

  def to_s
    return "#{to_face(value)} of #{suit.to_s}"
  end

end
