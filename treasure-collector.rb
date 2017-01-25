require 'gosu'
require_relative 'game'

class Tc < Gosu::Window
  def initialize
    super(640, 640)
    self.caption = "Treasure Hunt and Collector Game"
    @game = Game.new(self)

  end

  def update
    @game.update
  end

  def draw
    @game.draw
  end

  def button_down(id)
    @game.button_down(id)
  end
end

window = Tc.new
window.show
