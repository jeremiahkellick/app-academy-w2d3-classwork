require 'set'

class Hand < Array

  
  def initialize(*args, &block)
    super
  end

  def <=>(other_hand)
    self.sort_by! { |card| -card.to_i }
    self.score <=> other_hand.score
  end

  def render
    self.each_with_index do |card|
      puts "#{i+1} #{card.value} of #{card.suit}"
    end
  end

  protected

  def score
    straight_flush ||
    four_of_a_kind ||
    full_house ||
    flush ||
    straight ||
    three_of_a_kind ||
    two_pair ||
    one_pair ||
    high_card
  end

  private

  def straight_flush
    found_straight = straight
    found_straight && flush? ? [8, *found_straight.drop(1)] : nil
  end

  def four_of_a_kind
    quad = find_n(self, 4)
    quad ? [7, quad] : nil
  end

  def full_house
    trip = find_n(self, 3)
    pair = find_n(self, 2)
    trip && pair ? [6, trip] : nil
  end

  def flush
    flush? ? [5, *nums] : nil
  end

  def flush?
    self.all? { |card| card.suit == self[0].suit }
  end

  def straight
    cur = nums[0]
    arr = nums.dup
    if arr.first == 14 && arr[1] != 13
      arr << 1
      arr.shift
    end
    arr[1..4].each do |card|
      if card == cur - 1
        cur = card
      else
        return nil
      end
    end
    [4, *arr]
  end

  def three_of_a_kind
    trip = find_n(self, 3)
    trip ? [3, trip, *nums] : nil
  end

  def two_pair
    self
    pair1 = find_n(self, 2)
    pair2 = find_n(self.reject {|card| card.to_i == pair1}, 2)
    if pair1 && pair2
      [2, *[pair1, pair2].sort.reverse, *nums]
    else
      nil
    end
  end

  def one_pair
    pair = find_n(self, 2)
    pair ? [1, pair, *nums] : nil
  end

  def find_n(arr, n)
    numbers = arr.map(&:to_i)
    numbers.uniq.find { |num| numbers.count(num) == n}
  end

  def high_card
    [0, *nums]
  end

  def nums
    self.map(&:to_i)
  end
end
