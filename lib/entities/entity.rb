module Airstrike
	class Entity

		attr_accessor :position, :velocity, :origin, :scale, :rotation, :image, :mode, :color

		def initialize image = nil
			@position = Vec2.new
			@velocity = Vec2.new
			@origin = Vec2.new(0.5, 0.5)
			@scale = Vec2.new(1.0, 1.0)
			@rotation = 0.0
			@mode = :default
			@color = 0xffffffff
			@image = image
		end

		def set_position x, y
			@position.x, @position.y = x, y
			self
		end
		def set_rotation rotation
			@rotation = rotation
			self
		end

		def set_scale x, y
			@scale.x, @scale.y = x, y
			self
		end

		def update dt
		end		

		def draw
			if @image
				@image.draw_rot(
					@position.x, @position.y, 
					0.0, 
					Airstrike::to_degrees(@rotation), 
					@origin.x, @origin.y, 
					@scale.x, @scale.y, 
					@color, 
					@mode)
			end
		end		
	end
end