module Airstrike
	class Missile < Weapon

		attr_accessor :trail, :speed

		def initialize texture, trail_texture
			super(texture)

			@trail = SmokeTrailParticleSystem.new trail_texture
			@speed = 0.6
		end

		def update dt

			rot_speed = 0.003
			if Airstrike::wrap_angle(@rotation) < Vec2.angle(@position, CENTER)
				@rotation += rot_speed * dt 
			elsif Airstrike::wrap_angle(@rotation) > Vec2.angle(@position, CENTER)
				@rotation -= rot_speed * dt 
			else
			end

			@velocity.x = Math::cos(@rotation) * @speed
			@velocity.y = Math::sin(@rotation) * @speed

			@position.x += @velocity.x * dt
			@position.y += @velocity.y * dt
			@trail.move(@position)
			@trail.rotate_to(@rotation)
			@trail.update dt
		end

		def before_draw
			@trail.draw
		end
	end
end