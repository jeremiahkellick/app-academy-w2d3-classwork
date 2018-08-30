class Card
  attr_reader :value, :suit

  NUMERIC_VALUES = {
    "J" => 11,
    "Q" => 12,
    "K" => 13,
    "A" => 14
  }

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_i
    if @value.match(/[0-9]/)
      @value.to_i
    else
      NUMERIC_VALUES[@value]
    end
  end
end
