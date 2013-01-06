module Airstrike
	class Stage

		attr_accessor :background_color, :current, :duration, :tile_map, :enemies, :planes, :state

		STAGE_WIDTH = WIDTH * 2.0
		STAGE_HEIGHT = HEIGHT  * 2.0

		def initialize
			@enemies = []
			@planes = []
		end

		def load game_window

			# timers
			@current = 0.0
			@duration = 2 * 1000 # TODO: time from tiled

			@background_color = Gosu::Color::BLUE
			@background_color.red = 100
			@background_color.green = 150
			
			@clouds = Clouds.new(Airstrike::load_image(game_window, 'cloud'))

			# TODO: load from tiled, and place and set velocity
			@enemies << Tank.new(Airstrike::load_image(game_window, 'tank'))
				.set_position(WIDTH - 100, HEIGHT - 100)
				.set_velocity(rand() * -0.2, 0.0)
				.set_scale(0.3)
		end

		def add_plane game_window, start_x, start_y, end_x, end_y
			planes << Plane.new(Airstrike::load_image(game_window, 'plane'),
				Vec2.new(start_x, start_y),
				Vec2.new(end_x, end_y))
				.set_scale(0.5)
		end

		def progress
			@current / @duration
		end
		
		def update dt
			@current += dt

			@clouds.update dt
			@enemies.each { |e| e.update dt  }
			@planes.each { |e| e.update dt, progress  }
		end
		
		def draw game_window
			game_window.clear(@background_color)
			@clouds.draw
			@enemies.each { |e| e.draw }
			@planes.each { |e| e.draw }
		end
	end
end