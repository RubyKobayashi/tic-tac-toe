# :nodoc:
class Game
  attr_reader :player1
  attr_reader :player2
  attr_reader :turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = @player1
  end

  def change_turn
    if @turn == @player1
      @turn = @player2
    else
      @turn == @player1
    end
  end

  def play
    change_turn
  end
end
