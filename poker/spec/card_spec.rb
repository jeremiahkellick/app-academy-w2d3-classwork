require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new("3", :spades) }

  describe "#initialized" do
    it "initializes with a value" do
      expect(card.value).to eq("3")
    end

    it "initializes with a suit" do
      expect(card.suit).to eq(:spades)
    end
  end

  describe "#to_i" do
    it "converts value to number" do
      expect(card.to_i).to eq(3)
      expect(Card.new("A", :diamonds).to_i).to eq(14)
    end
  end
end
