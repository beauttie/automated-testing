require_relative 'test_helper'

describe Deck do
  # Write tests for the Deck class.
  # What should you test?
    # 1.  Expected Behavior
    # 2.  Edge cases
  before { @deck = Deck.new }

  describe "A new Deck is created with 52 Card objects" do
    it "Can be created" do
      expect(@deck).must_be_instance_of Deck
    end

    it "Is an Array of Card objects" do
      expect(@deck.cards).must_be_instance_of Array
      expect(@deck.cards.all?(Card)).must_equal true
    end

    it "Has 52 cards" do
      expect(@deck.count).must_equal 52
    end
  end

  describe "Testing draw method" do
    it "Raises NoMethodError for drawing more than 52 cards" do
      expect{
        53.times { @deck.draw }
      }.must_raise NoMethodError
    end

    it "Only draws one card" do
      @deck.draw

      expect(@deck.count).must_equal 51
    end

    it "Returns a Card object" do
      expect(@deck.draw).must_be_instance_of Card
    end

    it "Removes the drawn card from Deck" do
      drawn_card = @deck.draw

      expect((@deck.cards).include?(drawn_card)).must_equal false
    end
  end

  describe "Testing shuffle method" do
    it "Responds to shuffle" do
      expect(@deck).must_respond_to :shuffle
    end

    it "Shuffles the Deck" do
      shuffled_deck = @deck.dup.shuffle

      expect(shuffled_deck).wont_equal @deck
    end
  end

  describe "Testing count method" do
    it "Returns an Integer" do
      expect(@deck.count).must_be_instance_of Integer
    end

    it "Returns the correct number of cards in Deck" do
      5.times { @deck.draw }

      expect(@deck.count).must_equal 47
    end

    it "Returns 0 when all cards are drawn" do
      52.times { @deck.draw }

      expect(@deck.count).must_equal 0
    end
  end
end
