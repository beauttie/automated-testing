require_relative 'test_helper'

describe Card do
  describe "You can create a Card instance" do

    it "Can be created" do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          expect(card).must_be_instance_of Card
        end
      end
    end

    it "Raises an ArgumentError for invalid parameters" do
      # To raise an ArgumentError in card.rb
      # raise ArgumentError.new
      expect {Card.new(0, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :clovers)}.must_raise ArgumentError
    end
  end

  describe "Testing to_s" do

    it "to_s returns a readable String value logically for values 2-10" do
      # Test to ensure that to_s works for cards values 2-10
      # for example:  "2 of diamonds"
      (2..10).each do |card_value|
        card = Card.new(card_value, :diamonds)
        expect(card.to_s).must_equal "#{card_value} of diamonds"
      end
    end

    it "to_s returns a readable String value for Ace, Jack, Queen, King" do
      # Test to ensure that to_s works for cards values 1, and 11-13
      # For example: "Queen of hearts"
      # The current implementation of to_s does not address this feature
      # Write the test, see it fail, then modify to_s to make it pass!
      # (Consider writing a helper method!)
      #
      # For reference:
      #  1: Ace
      #  11: Jack
      #  12: Queen
      #  13: King
      face_cards = {
          1 => "Ace",
          11 => "Jack",
          12 => "Queen",
          13 => "King"
      }

      face_cards.each do |k, v|
        card = Card.new(k, :hearts)
        expect(card.to_s).must_equal "#{v} of hearts"
      end
    end
  end

  describe "Reader methods" do
    let (:card_1) { Card.new(1, :spades) }
    let (:card_2) { Card.new(13, :diamonds) }
    let (:card_3) { Card.new(10, :clubs) }

    it "Can retrieve the value of the card using a `.value`." do
      # ensure that `.value works as expected`
      expect(card_1.value).must_equal 1
      expect(card_2.value).must_equal 13
      expect(card_3.value).must_equal 10
    end

    it "Can retrieve the value of the card using a `.suit`." do
      # ensure that `.suit works as expected returning the symbol of the suit`
      expect(card_1.suit).must_equal :spades
      expect(card_2.suit).must_equal :diamonds
      expect(card_3.suit).must_equal :clubs
    end
  end

end
