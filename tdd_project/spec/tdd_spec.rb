require 'tdd'

describe "my_uniq" do
  it "removes dups" do
    expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
  end

  context 'when given an empty array' do
    it 'returns []' do
      expect(my_uniq([])).to eq([])
    end
  end

  context 'when given an array with no duplicates' do
    it 'returns the same values' do
      expect(my_uniq([1, 2, 3])).to eq([1, 2, 3])
    end
  end
end

describe "Array#two_sum" do
  it "generic two sum" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end

  context 'when there\'s no two sums' do
    it 'returns []' do
      expect([1, 2, 3, 4, 5].two_sum).to eq([])
    end
  end

  context 'when given all zeros' do
    it 'returns every pair of indexes' do
      expect([0, 0, 0].two_sum).to eq([[0, 1], [0, 2], [1, 2]])
    end
  end
end

describe 'my_transpose' do
  it "transposes an array" do
    expect(my_transpose([
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ])).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
  end
end

describe 'stock_picker' do
  it "picks the most profitable buying and selling points" do
    expect(stock_picker([50, 1, 20, 9000])).to eq([1,3])
  end
  context "when arr.length is less than 2" do
    it "returns nil" do
      expect(stock_picker([1])).to be(nil)
    end
  end
end
