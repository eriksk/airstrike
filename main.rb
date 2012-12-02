require 'gosu'
require_relative 'config'

require_relative 'lib/utils/utils'
require_relative 'lib/utils/vec2'

require_relative 'lib/entities/entity'
require_relative 'lib/entities/clouds'

require_relative 'lib/game'

module Airstrike
	class GameWindow < Gosu::Window

		attr_accessor :game

	  	def initialize()
		  super(WIDTH, HEIGHT, FULLSCREEN)
			self.caption = "Airstrike"
			@game = Game.new(self)
		end

		def button_down(id)
			if id == Gosu::KbEscape
				self.close
			end
		end

		def update
		  dt = 16.0
		  @game.update(dt)
		end

		def draw
		  @game.draw()
		end

		def clear color
			draw_quad(
				0, 0, color,
				WIDTH, 0, color,
				WIDTH, HEIGHT, color,
				0, HEIGHT, color
			)			
		end
	end
end

game_window = Airstrike::GameWindow.new
game_window.show