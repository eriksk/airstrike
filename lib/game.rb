module Airstrike
	class Game

		attr_accessor :game_window

		def initialize(game_window)
			@game_window = game_window
			
			@stage = Stage.new
			@stage.load(@game_window)
		end

		def update(dt)
			@stage.update dt
		end

		def draw
			@stage.draw @game_window
		end
	end
end