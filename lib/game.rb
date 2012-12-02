module Airstrike
	class Game

		attr_accessor :game_window

		def initialize(game_window)
			@game_window = game_window
			@background_color = 0xffffffff
			@ground_pieces = []
			@ground_pieces << Entity.new(Airstrike::load_image(@game_window, 'ground'))
				.set_position(WIDTH / 2.0, HEIGHT - (24 / 2.0))
		end

		def update(dt)
		end

		def draw
			@game_window.clear(@background_color)
			@ground_pieces.each{ |i| i.draw }
		end
	end
end