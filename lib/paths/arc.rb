module Airstrike
	class Arc

		attr_accessor :start_point, :end_point, :interval

		def initialize start_point = Vec2.zero, end_point = Vec2.zero
			@start_point, @end_point = start_point, end_point
			@interval = 64
		end

		def distance
			Vec2.distance(@start_point, @end_point)
		end

		def angle
			Vec2.angle(@start_point, @end_point)
		end
		
		def draw blop_texture
			# TODO: draw based on type
			# TODO: calc distance and divide by interval to get px for every point
			count = (distance / @interval).to_i + 1
			count.times do |i|
				p = Vec2.new(@start_point.x + Math::cos(angle)  * (@interval * i), @start_point.y + Math::sin(angle)  * (@interval * i))
				blop_texture.draw_rot(
					p.x, p.y, 
					#Airstrike::lerp(@start_point.x, @end_point.x, i.to_f / count.to_f), 
					#Airstrike::lerp(@start_point.y, @end_point.y, i.to_f / count.to_f),
					0, 0,
					0.5, 0.5,
					0.5, 0.5
				)
			end
		end
	end
end