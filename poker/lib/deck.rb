require_relative 'card.rb'

class Deck < Array

  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = [:spades, :clubs, :hearts, :diamonds]

  def initialize
    SUITS.each do |suit|
      VALUES.each { |value| self << Card.new(value, suit)}
    end
    self.shuffle!
  end

  def draw(amount=nil)
    if amount
      self.pop(amount)
    else
      self.pop
    end
  end
end
