module Airstrike
	def Airstrike.load_image game_window, name
		Gosu::Image.new(game_window, "#{GFX_PATH}#{name}.png")
	end

	def Airstrike.to_degrees radiens
		radiens * 180 / Math::PI
	end

	def Airstrike.lerp x, y, w
		x + (y - x) * w		
	end
end