class Player
  attr_accessor :hand, :pot

  def initialize
    @hand = Hand.new
    @pot = 0
  end

  def discard
    @hand.render
    puts "which cards would you like to discard? (up to three)"
    gets.chomp.split(",").map { |v| v.to_i - 1}.each { |i| @hand.delete_at(i)}.length

  end

  def get_action
    puts "Would you like to (f)old, (s)ee, or (r)aise?"
    case gets.chomp
    when "f"
      :fold
    when "s"
      :see
    when "r"
      :raise
    else
      raise RuntimeError
    end
  rescue RuntimeError
    puts "Invalid input"
    retry
  end
end
