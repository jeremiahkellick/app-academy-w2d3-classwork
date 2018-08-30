require_relative 'deck'
require_relative 'player'
require_relative 'hand'

class Game
  def initialize(players)
    @players = players
    @deck = Deck.new
    @total_pot = 0
    @current_bet = 0
  end

  def play
    @players.each do |player|
      player.hand.concat(@deck.draw(5))
    end
    betting_iteration
    @players.each do |player|
      player.hand.draw(player.discard)

  end

  def betting_iteration
    flag = true
    while flag
      flag = false
      @players.each do |player|
        input = get_action

        case input
        when :fold
          @total_pot += player.pot
          @players.delete(player)
        when :see
          @player.pot = @current_bet
        when :raise
          @player.pot += 1
          @current_bet = @player.pot
          flag = true
        end
      end
    end
  end
end
