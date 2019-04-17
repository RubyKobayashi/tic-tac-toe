# frozen_string_literal: true

require 'game'

# :nodoc:
class Board
  attr_accessor :fields

  def initialize
    @fields = {
      'A' => { 1 => nil, 2 => nil, 3 => nil },
      'B' => { 1 => nil, 2 => nil, 3 => nil },
      'C' => { 1 => nil, 2 => nil, 3 => nil }
    }
  end
end
