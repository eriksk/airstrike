module Airstrike
	class Game

		attr_accessor :game_window

		def initialize(game_window)
			@game_window = game_window
			@cursor = Entity.new(Airstrike::load_image(game_window, 'blob_yellow')).set_scale(0.3)

			@stage = Airstrike::StageLoader.load(game_window, "stage1")
		end

		def update(dt)
			@stage.update dt
			@cursor.position.x = @game_window.mouse_x
			@cursor.position.y = @game_window.mouse_y
		end

		def draw
			@stage.draw @game_window
			@cursor.draw
		end
	end
end