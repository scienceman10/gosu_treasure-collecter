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
    if tile_is_drawn? && !hidden?
      x1 = @column * WIDTH
      y1 = @row * HEIGHT
      x2 = x1 + WIDTH
      y2 = y1
      x3 = x2
      y3 =  y2 + HEIGHT
      x4 = x1
      y4 = y3
      c = color
      @@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)
      x_center = x1 + (WIDTH / 2)
      x_text = x_center - @@font.text_width("#{@type}") / 2
      y_text = y1 + 4
      @@font.draw("#{@type}", x_text, y_text, 1)
    end
  end
  def color
    if is_player?
      @@colors[:red]
    elsif is_exit?
      @@colors[:green]
    elsif is_treasure?
      @@colors[:gold]
    else
      @@colors[:blue]
    end
  end
  def move_to(column, row)
    @column = column
    @row = row
  end
  def move_by(column_change, row_change)
    move_to(@column + column_change, @row + row_change)
  end
  def is_treasure?
    @type == TREASURE_T
  end
  def is_start?
    @type == START_T
  end
  def is_exit?
    @type == EXIT_T
  end
  def is_player?
    @type == PLAYER_T
  end
  def is_empty?
    @type == EMPTY_T || @type == ' '
  end
  def hidden?
    @hidden
  end
  def hide!
    @hidden = true
  end
  def make_empty
    @type = EMPTY_T
  end
  def tile_is_drawn?
    !is_empty? && !is_start?
  end
  def tile_can_be_entered?
    is_empty? || is_start? || is_treasure? || is_exit?
  end
end
