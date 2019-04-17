# frozen_string_literal: true

require 'game'
require 'board'
require 'UI'
# As a player
# In order to be able to play the game
# Id like to be able to play against someone else

RSpec.describe 'TicTacToe' do
  it '2 players can play the game' do
    board = Board.new
    game = Game.new('Bob', 'Jon', board)
    expect(game.player1).to eq('Bob')
    expect(game.player2).to eq('Jon')
  end

  # As a player
  # So the game is fair
  # Id like the turns to alternate between myself
  # and the other player until the game ends

  it 'the turn alternates between player 1 and 2' do
    board = Board.new
    game = Game.new('Bob', 'Jon', board)
    expect(game.turn).to eq('Bob')
    game.play('A1')
    expect(game.turn).to eq('Jon')
  end

  # As a player
  # In order to ensure that you cannot claim a taken field
  # Id like to only be able to claim a field if it is not taken

  it 'only untaken fields can be taken' do
    board = Board.new
    game = Game.new('Bob', 'Jon', board)
    ui = UI.new(board)
    expect(game.turn).to eq('Bob')
    game.play('A1')
    expect { game.play('A1') }.to raise_error('This field is already taken, please choose another one')
    expect(game.turn).to eq('Jon')
    game.play('B1')
    expect { ui.see_board }.to output("\"[X][_][_]\"\n\"[O][_][_]\"\n\"[_][_][_]\"\n").to_stdout
    expect(game.turn).to eq('Bob')
  end
end
