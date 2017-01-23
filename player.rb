require 'gosu'
require_relative 'tile'

class Player < Tile
  attr_reader :score

  def initialize(window, column, row)
    super(window, column, row, Tile::PLAYER_T)
    @score = 0
  end
end
