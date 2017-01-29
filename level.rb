require 'gosu'
require_relative 'tile'
require_relative 'player'

class Level
  def initialize(window, player, level_data)
    @window = window
    @tiles = []
    @level_data = level_data
    @total_rows = 0
    @total_columns = 0
    @exit_reached = false
    if @level_data
      @total_rows = @level_data.length
      if @total_rows > 0
        @total_columns = @level_data.first.length
      end
      setup_level
    end
  end
  def setup_level
    @level_data.each_with_index do |row_data, row|
      column = 0
      row_data.each_char do |cell_type|
        tile = Tile.new(@window, column, row, cell_type)
        if tile.is_start?
          @player.move_to(column, row)
        end
        @tiles.push(tile)
        column += 1
      end
    end
  end
  def button_down(id)
    # if id == Gosu::KbH
      # @window.hide
      # puts ""
    # end
    if level_over?
      return
    end
    column_change = 0
    row_change = 0
    if id == Gosu::KbLeft
      column_change = -1
    elsif id == Gosu::KbRight
      column_change = 1
    elsif id == Gosu::KbUp
      row_change = -1
    elsif id == Gosu::KbDown
      row_change = 1
    end
  end
  def move_valid?(@player, column_change, row_change)
  end
  def update
  end
  def draw
  end

end
