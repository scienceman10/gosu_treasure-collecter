puts "started treasure-collector"
require 'gosu'
require_relative 'game'

class Tc < Gosu::Window
  def initialize
    puts "welcome to my game! press 'h' for help."
    sleep(1.5)
    super(640, 640)
    self.caption = "Treasure Hunt and Collecting Game"
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
