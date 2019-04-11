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
end
