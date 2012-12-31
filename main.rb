require 'gosu'
require_relative 'config'

require_relative 'lib/utils/utils'
require_relative 'lib/utils/vec2'

require_relative 'lib/paths/arc'
require_relative 'lib/paths/arc_factory'

require_relative 'lib/entities/entity'
require_relative 'lib/entities/clouds'
require_relative 'lib/entities/vehicle'
require_relative 'lib/entities/tank'

require_relative 'lib/entities/plane'

require_relative 'lib/stages/stage'

require_relative 'lib/entities/weapon'
require_relative 'lib/entities/missile'

require_relative 'lib/particles/particle'
require_relative 'lib/particles/particle_system'
require_relative 'lib/particles/smoke_trail_particle_system'

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