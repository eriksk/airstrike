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

		def contains?(x, y)
			false
		end

		def contains?(entity)
			false
		end

		def set_position x, y
			@position.x, @position.y = x, y
			self
		end

		def set_velocity x, y
			@velocity.x, @velocity.y = x, y
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
		def set_scale scale
			@scale.x, @scale.y = scale, scale
			self
		end

		def update dt
			before_update dt
			@position.x += @velocity.x * dt
			@position.y += @velocity.y * dt
			after_update dt
		end		

		def before_update dt
		end
		def after_update dt
		end

		def before_draw
		end
		def after_draw
		end

		def draw
			before_draw
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
			after_draw
		end		
	end
end