require "rspec"
require "towers_of_hanoi"

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe "#initialize" do
    it "creates a towers array" do
      expect(game.towers).to eq([[3, 2, 1], [], []])
    end
  end

  describe "#move" do
    it "moves a disc" do
      game.move(0, 1)
      expect(game.towers).to eq([[3, 2], [1], []])
    end

    context "when trying to move a larger disc on top of a smaller disc" do
      it "raises an ArgumentError" do
        game.move(0, 1)
        expect { game.move(0, 1) }.to raise_error(ArgumentError)
      end
    end

    context "when given an index outside of the array" do
      it "raises an ArgumentError" do
        expect { game.move(0, 5) }.to raise_error(ArgumentError)
      end
    end

    context "when trying to move from an empty tower" do
      it "raises an ArgumentError" do
        expect { game.move(1, 0) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#won?" do
    context "when the full tower has been moved" do
      subject(:game) { TowersOfHanoi.new([[], [3, 2, 1], []]) }

      it "returns true" do
        expect(game.won?).to be(true)
      end
    end

    context "when the towers has not been fully moved" do
      it "returns false" do
        expect(game.won?).to be(false)
      end
    end
  end

  describe "#play" do
    subject(:game) { TowersOfHanoi.new([[1],[3, 2],[]])}
    before(:each) {allow(game).to receive(:get).and_return([0,1])}
    it "calls #get" do
      expect(game).to receive(:get)
      game.play
    end

    it "calls #move" do
      expect(game).to receive(:move).and_call_original
      game.play
    end

    it "calls #render" do
      expect(game).to receive(:render).at_least(:once)
      game.play
    end

    it "calls #won?" do
      expect(game).to receive(:won?).at_least(:once).and_call_original
      game.play
    end
  end
end
