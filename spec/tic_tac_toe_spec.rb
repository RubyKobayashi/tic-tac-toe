require 'game'
# As a player
# In order to be able to play the game
# Id like to be able to play against someone else

RSpec.describe 'TicTacToe' do
  it '2 players can play the game' do
    game = Game.new('Bob', 'Jon')
    expect(game.player1).to eq('Bob')
    expect(game.player2).to eq('Jon')
  end

  # As a player
  # So the game is fair
  # Id like the turns to alternate between myself
  # and the other player until the game ends

  it 'the turn alternates between player 1 and 2' do
    game = Game.new('Bob', 'Jon')
    expect(game.turn).to eq('Bob')
    game.play
    expect(game.turn).to eq('Jon')
  end
end
