require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "initializes with all cards" do
      expect(deck.length).to eq(52)
    end
  end

  describe "#draw" do
    context "when given an amount" do
      it "returns an array of top x cards" do
        expect(deck.draw(5).length).to eq(5)
      end
      it "removes x cards from deck" do
        deck.draw(5)
        expect(deck.length).to eq(47)
      end
    end
    context "when not given an amount" do
      it "returns top card" do
        top_card = deck.last
        expect(deck.draw).to be(top_card)
      end
      it "removes top card from deck" do
        deck.draw
        expect(deck.length).to eq(51)
      end
    end
  end
end
