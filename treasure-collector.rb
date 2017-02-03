puts "started treasure-collector"
require 'gosu'
require_relative 'game'

class Tc < Gosu::Window
  def initialize
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

puts "starting in:"
for i in -3..-0 do
  puts i.abs
  sleep(1)
end
window = Tc.new
window.show
sleep(100)
abort "sorry! took to long!"
