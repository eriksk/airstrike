module Airstrike
	class Particle < Entity

		attr_accessor :current, :duration

		def initialize texture, duration
			super(texture)
			@current, @duration = 0.0, duration
		end

		def reset
			@current = 0.0			
		end
	end
end