module Airstrike
	class Game

		attr_accessor :game_window

		def initialize(game_window)
			@game_window = game_window
			@background_color = Gosu::blue
			@background_color.red = 100
			@background_color.green = 150

			@ground_pieces = []
			@ground_pieces << Entity.new(Airstrike::load_image(@game_window, 'ground'))
				.set_position(WIDTH / 2.0, HEIGHT - (24 / 2.0))

			@clouds = Clouds.new(Airstrike::load_image(@game_window, 'cloud'))

			@tank = Tank.new(Airstrike::load_image(@game_window, 'tank'))
				.set_velocity(-0.1, 0.0)
				.set_position(800, HEIGHT - 64)
				.set_scale(0.3)
		end

		def update(dt)
			@clouds.update dt
			@tank.update dt
		end

		def draw
			@game_window.clear(@background_color)
			@clouds.draw

			@tank.draw


			@ground_pieces.each{ |i| i.draw }
		end
	end
end