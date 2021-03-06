# frozen_string_literal: true

require 'board'
require 'game'

# :nodoc:
class UI
  attr_reader :board_model

  def initialize(board_model)
    @board_model = board_model
    @board = []
  end

  def see_board
    fill_fields
    format
  end

  private

  def format
    board = @board.each_slice(3).to_a
    board.each do |element|
      p element.join
    end
  end

  def fill_fields
    @board_model.fields.each do |_key, value|
      n = 1
      while n < 4
        if value[n] == 'X'
          @board << '[X]'
        elsif value[n].nil?
          @board << '[_]'
        elsif value[n] == 'O'
          @board << '[O]'
        end
        n += 1
      end
    end
  end
end
