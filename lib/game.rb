# frozen_string_literal: true

require 'board'
require 'UI'

# :nodoc:
class Game
  attr_reader :player1
  attr_reader :player2
  attr_reader :turn
  attr_reader :board

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @turn = @player1
  end

  def play(move)
    raise_error if field_taken?(move)
    register_move(move)
    change_turn
  end

  private

  def change_turn
    @turn = if @turn == @player1
              @player2
            else
              @player1
            end
  end

  def field_taken?(move)
    @board.fields[move[0]][move[1].to_i] != nil
  end

  def raise_error
    raise 'This field is already taken, please choose another one'
  end

  def register_move(move)
    if @turn == @player1
      @board.fields[move[0]][move[1].to_i] = 'X'
    elsif @turn == @player2
      @board.fields[move[0]][move[1].to_i] = 'O'
    end
  end
end
