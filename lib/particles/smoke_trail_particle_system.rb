module Airstrike
	class SmokeTrailParticleSystem < ParticleSystem

		def initialize texture
			super(texture)

			@amount = 1
			@interval = 50
		end

		def spawn	
			spread = 1
			@amount.times do |i|
				p = pop
				p.relative_to :local
				p.set_scales(0.5, 0.8)
				 .set_velocities(
				 	-(0.3 + rand()), 0.0,
				 	0.0, 0.0)
			end
		end		
	end
end