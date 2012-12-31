module Airstrike
	class Vec2

		attr_accessor :x, :y

		def initialize(x = 0.0, y = 0.0)
			@x, @y = x, y
		end

		def direction
			Math::atan2(y, x)
		end

		def *(scalar)
			Vec2.new(x * scalar, y * scalar)
		end

		def length
			Math::sqrt((x * x) + (y * y))
		end

		def clone
			Vec2.new(x, y)
		end

		# class defs

		def self.zero
			Vec2.new
		end

		def self.distance v1, v2
			Math::sqrt(((v2.x - v1.x) * (v2.x - v1.x)) + ((v2.y - v1.y) * (v2.y - v1.y)))
		end

		def self.angle v1, v2
			Math::atan2(v2.y - v1.y, v2.x - v1.x)			
		end

		def self.lerp v1, v2, progress
			Vec2.new(
				Airstrike::lerp(v1.x, v2.x, progress),
				Airstrike::lerp(v1.y, v2.y, progress))
		end
	end
end