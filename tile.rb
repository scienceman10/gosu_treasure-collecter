require 'gosu'

class Tile
  PLAYER_T = 'P'
  START_T = 'S'
  EXIT_T = 'E'
  TREASURE_T = 'T'
  EMPTY_T = '.'
  WIDTH = 32
  HEIGHT = 32
  attr_reader :row, :column, :type

  def initialize(window, column, row,  type)
    @@colors ||= {
      red: Gosu::Color.argb(0xaaff0000),
      green: Gosu::Color.argb(0xaa00ff00),
      gold: Gosu::Color.argb(0xaaffff00),
      blue: Gosu::Color.argb(0xaa0000ff)
    }
    @@font ||= Gosu::Font.new(24)
    @@window ||= window
    @row = row
    @column = column
    @type = type
    @hidden = false
  end
  def draw
  end
  
end
