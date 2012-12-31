module Airstrike
	class Plane < Vehicle

		attr_accessor :trail, :missiles, :start_position, :end_position

		def initialize texture, start_position, end_position
			super(texture)
			@start_position, @end_position = start_position, end_position
		end

		def update dt, progress
			@position.x = Airstrike::qlerp(@start_position.x, @end_position.x, progress)
			@position.y = Airstrike::qlerp(@start_position.y, @end_position.y, progress)
		end
	end
end