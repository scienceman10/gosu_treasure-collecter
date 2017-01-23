require 'gosu'
require_relative 'player'
require_relative 'level'

class Game
  LEVEL1 = [
    "+------------------+",
    "|S.|....T..........|",
    "|..|.--------..|++.|",
    "|..|.|....|T|..|T..|",
    "|.+|.|.E|.|....|...|",
    "|..|.|---.|.|--|...|",
    "|..|.|....|.|......|",
    "|+.|.|......|..|=|.|",
    "|..|.|-----.|..|+|.|",

  ]
  def initialize(window)
    @window = window
    @player = Player.new(@window, 0, 0)
    @level = Level.new(@window, @player, LEVEL1)
    @font = Gosu::Font.new(32)
    @start_time = Time.now.to_i
  end
  def button_down(id)
  end
  def update
  end
  def draw
  end
end
