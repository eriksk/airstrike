module Airstrike
	class ArcFactory

		attr_accessor :arc

		def initialize
		end

		def started?
			@arc != nil
		end

		def start start_point
			@arc = Arc.new(start_point, start_point.clone)
		end

		def move x, y
			@arc.end_point.x, @arc.end_point.y = x, y
		end

		def done
			arc = @arc
			@arc = nil
			return arc
		end
		
		def draw_preview arc_texture
			if @arc
				@arc.draw arc_texture
			end
		end		
	end
end