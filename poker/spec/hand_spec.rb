require 'hand'

describe Hand do
  describe "#initialize" do
    it "adds cards from passed in array" do
      expect(Hand.new([1, 2, 3, 4])).to contain_exactly(1, 2, 3, 4)
    end
  end

  let(:royal_flush) do
    Hand.new([
      double(value: 'A', suit: :spades),
      double(value: 'K', suit: :spades),
      double(value: 'Q', suit: :spades),
      double(value: 'J', suit: :spades),
      double(value: '10', suit: :spades)
    ])
  end
  let(:straight_flush) do
    Hand.new([
      double(value: '6', suit: :spades),
      double(value: '5', suit: :spades),
      double(value: '4', suit: :spades),
      double(value: '3', suit: :spades),
      double(value: '2', suit: :spades)
    ])
  end
  let(:four_of_a_kind_high) do
    Hand.new([
      double(value: 'K', suit: :spades),
      double(value: 'J', suit: :diamonds),
      double(value: 'J', suit: :hearts),
      double(value: 'J', suit: :spades),
      double(value: 'J', suit: :clubs)
    ])
  end
  let(:four_of_a_kind_low) do
    Hand.new([
      double(value: '10', suit: :spades),
      double(value: '4', suit: :diamonds),
      double(value: '4', suit: :hearts),
      double(value: '4', suit: :spades),
      double(value: '4', suit: :clubs)
    ])
  end
  let(:full_house_high) do
    Hand.new([
      double(value: '7', suit: :spades),
      double(value: '7', suit: :diamonds),
      double(value: 'J', suit: :hearts),
      double(value: 'J', suit: :spades),
      double(value: 'J', suit: :clubs)
    ])
  end
  let(:full_house_low) do
    Hand.new([
      double(value: '3', suit: :spades),
      double(value: '3', suit: :diamonds),
      double(value: '8', suit: :hearts),
      double(value: '8', suit: :spades),
      double(value: '8', suit: :clubs)
    ])
  end
  let(:flush_low) do
    Hand.new([
      double(value: '9', suit: :hearts),
      double(value: '8', suit: :hearts),
      double(value: '5', suit: :hearts),
      double(value: '3', suit: :hearts),
      double(value: '2', suit: :hearts)
    ])
  end
  let(:flush_high) do
    Hand.new([
      double(value: 'K', suit: :spades),
      double(value: 'Q', suit: :spades),
      double(value: '7', suit: :spades),
      double(value: '3', suit: :spades),
      double(value: '2', suit: :spades)
    ])
  end
  let(:straight_high) do
    Hand.new([
      double(value: 'Q', suit: :spades),
      double(value: 'J', suit: :diamonds),
      double(value: '10', suit: :hearts),
      double(value: '9', suit: :spades),
      double(value: '8', suit: :clubs)
    ])
  end
  let(:straight_low) do
    Hand.new([
      double(value: '10', suit: :spades),
      double(value: '9', suit: :diamonds),
      double(value: '8', suit: :hearts),
      double(value: '7', suit: :spades),
      double(value: '6', suit: :clubs)
    ])
  end
  let(:three_of_a_kind_low) do
    Hand.new([
      double(value: '3', suit: :spades),
      double(value: '3', suit: :diamonds),
      double(value: '5', suit: :hearts),
      double(value: '3', suit: :clubs),
      double(value: '6', suit: :clubs)
    ])
  end
  let(:three_of_a_kind_high) do
    Hand.new([
      double(value: '7', suit: :spades),
      double(value: '7', suit: :diamonds),
      double(value: 'J', suit: :hearts),
      double(value: '7', suit: :clubs),
      double(value: 'Q', suit: :clubs)
    ])
  end
  let(:two_pairs_lower) do
    Hand.new([
      double(value: '5', suit: :spades),
      double(value: '5', suit: :diamonds),
      double(value: '3', suit: :hearts),
      double(value: '3', suit: :clubs),
      double(value: 'J', suit: :clubs)
    ])
  end
  let(:two_pairs_low) do
    Hand.new([
      double(value: 'K', suit: :spades),
      double(value: 'K', suit: :diamonds),
      double(value: '2', suit: :hearts),
      double(value: '2', suit: :clubs),
      double(value: '7', suit: :clubs)
    ])
  end
  let(:two_pairs_med) do
    Hand.new([
      double(value: 'K', suit: :spades),
      double(value: 'K', suit: :diamonds),
      double(value: '3', suit: :hearts),
      double(value: '3', suit: :clubs),
      double(value: '4', suit: :clubs)
    ])
  end
  let(:two_pairs_high) do
    Hand.new([
      double(value: 'K', suit: :spades),
      double(value: 'K', suit: :diamonds),
      double(value: '3', suit: :hearts),
      double(value: '3', suit: :clubs),
      double(value: 'A', suit: :clubs)
    ])
  end
  let(:pair_high) do
    Hand.new([
      double(value: '7', suit: :spades),
      double(value: '2', suit: :diamonds),
      double(value: 'K', suit: :hearts),
      double(value: 'K', suit: :clubs),
      double(value: 'Q', suit: :clubs)
    ])
  end
  let(:pair_low) do
    Hand.new([
      double(value: '5', suit: :spades),
      double(value: 'J', suit: :diamonds),
      double(value: '10', suit: :hearts),
      double(value: '10', suit: :clubs),
      double(value: 'A', suit: :clubs)
    ])
  end
  let(:high_card_high) do
    Hand.new([
      double(value: '5', suit: :spades),
      double(value: '9', suit: :diamonds),
      double(value: '4', suit: :hearts),
      double(value: '7', suit: :clubs),
      double(value: 'A', suit: :clubs)
    ])
  end
  let(:high_card_low) do
    Hand.new([
      double(value: '5', suit: :spades),
      double(value: '2', suit: :diamonds),
      double(value: '4', suit: :hearts),
      double(value: 'Q', suit: :clubs),
      double(value: '9', suit: :clubs)
    ])
  end
  describe "#<=>" do
    it "ranks the cards properly" do
      all_hands = [
        high_card_low,
        high_card_high,
        pair_low,
        pair_high,
        two_pairs_lower,
        two_pairs_low,
        two_pairs_med,
        two_pairs_high,
        three_of_a_kind_low,
        three_of_a_kind_high,
        straight_low,
        straight_high,
        flush_low,
        flush_high,
        full_house_low,
        full_house_high,
        four_of_a_kind_low,
        four_of_a_kind_high,
        straight_flush,
        royal_flush
      ]
      numeric_values = { "J" => 11, "Q" => 12, "K" => 13, "A" => 14 }
      all_hands.each do |hand|
        hand.each do |card|
          val = card.value
          num = val.match(/[0-9]/) ? val.to_i : numeric_values[val]
          allow(card).to receive(:to_i).and_return(num)
          allow(card).to receive(:inspect).and_return("#{num}-#{card.suit}")
        end
      end
      expect(all_hands.shuffle.sort).to eq(all_hands)
    end
  end
end
