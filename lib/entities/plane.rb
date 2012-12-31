module Airstrike
	class Plane < Vehicle

		attr_accessor :trail, :missiles, :start_position, :end_position

		def initialize texture, start_position, end_position
			super(texture)
			@start_position, @end_position = start_position, end_position
		end

		def update dt, progress
			@position.x = Airstrike::lerp(@start_position.x, @end_position.x, progress)
			@position.y = Airstrike::lerp(@start_position.y, @end_position.y, progress)
			@rotation = Vec2.angle @start_position, @end_position
		end
	end
end