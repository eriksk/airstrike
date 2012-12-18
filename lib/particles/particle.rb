module Airstrike
	class Particle < Entity

		attr_accessor :relative_to, :current, :duration, :start_scale, :end_scale, :start_velocity, :end_velocity

		def initialize parent, texture, duration
			super(texture)
			@parent = parent
			@current, @duration = 0.0, duration
			@start_scale = 1.0
			@end_scale = 1.0
			@start_velocity = Vec2.new
			@end_velocity = Vec2.new
			@space = :world # or :local
		end

		def relative_to space
			@space = space
		end

		def reset
			@current = 0.0			
		end

		def progress
			@current / @duration
		end

		def set_velocities(start_x, start_y, end_x, end_y)
			case @space
				when :world
					@start_velocity.x, @start_velocity.y = start_x, start_y
					@end_velocity.x, @end_velocity.y = end_x, end_y
				when :local
					local_speed = @start_velocity.length
					@start_velocity.x, @start_velocity.y = start_x + (Math::cos(@parent.rotation) * local_speed), start_y + (Math::sin(@parent.rotation) * local_speed)
					@end_velocity.x, @end_velocity.y = end_x + (Math::cos(@parent.rotation) * local_speed), end_y + (Math::sin(@parent.rotation) * local_speed)
			end
			self
		end

		def set_scales start_scale, end_scale
			@start_scale, @end_scale = start_scale, end_scale
			self
		end

		def after_update dt
			set_scale(Airstrike::lerp(@start_scale, @end_scale, progress))
			set_velocity(
				Airstrike::lerp(@start_velocity.x, @end_velocity.x, progress),
				Airstrike::lerp(@start_velocity.y, @end_velocity.y, progress)
			)
			# TODO: lerp on colors too
		end
	end
end