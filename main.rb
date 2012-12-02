require 'gosu'
require_relative 'config'
require_relative 'lib/game'

module Airstrike
	class GameWindow < Gosu::Window

		attr_accessor :game

	  def initialize()
		  super(WIDTH, HEIGHT, FULLSCREEN)
			self.caption = "Airstrike"
			@game = Game.new(self)
		end

		def update
		  dt = 16.0
		  @game.update(dt)
		end

		def draw
		  @game.draw()
		end
	end
end

game_window = Airstrike::GameWindow.new
game_window.show