# frozen_string_literal: true

require 'game'
require 'board'
require 'UI'
# As a player
# In order to be able to play the game
# Id like to be able to play against someone else

RSpec.describe UI do
  subject(:ui) { described_class.new(board_model) }
  let (:board_model) { instance_double('Board', fields: { 'A' => { 1 => nil, 2 => 'X', 3 => 'O' }, 'B' => { 1 => nil, 2 => nil, 3 => nil }, 'C' => { 1 => nil, 2 => nil, 3 => nil } }) }

  it 'formats board_model for output' do
    expect{ui.see_board}.to output("\"[_][X][O]\"\n\"[_][_][_]\"\n\"[_][_][_]\"\n").to_stdout
  end

end
