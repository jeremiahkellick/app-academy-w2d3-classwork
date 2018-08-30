class TowersOfHanoi
  attr_reader :towers

  def initialize(towers = [[3, 2, 1], [], []])
    @towers = towers
  end

  def move(from, to)
    raise ArgumentError unless from.between?(0,2) && to.between?(0, 2)
    raise ArgumentError if @towers[from].empty?
    if (@towers[to].last || Float::INFINITY) < @towers[from].last
      raise ArgumentError
    end
    @towers[to] << @towers[from].pop
  end

  def won?
    @towers[1] == [3, 2, 1] || @towers[2] == [3, 2, 1]
  end

  def play
    until won?
      render
      move(*get)
    end
    render
    puts "you won"
  end

  def render
    p @towers
  end

  def get
    gets.chomp.split(",").map(&:to_i)
  end
end

if __FILE__ == $PROGRAM_NAME
  TowersOfHanoi.new.play
end
