module Airstrike
	class Clouds < Entity

		def initialize(image, quantity = 5)
			super(image)
			@quantity = quantity	

			@clouds = []
			quantity.times{|i| 
				@clouds << Entity.new(@image)
					.set_position(rand() * 800, rand() * 300)
					.set_velocity(rand() * 0.01, 0.0)
					.set_scale(0.3 + rand() * 0.4)
			}
		end
		
		def update dt
			@clouds.each{|i| 
				i.update dt
				if i.position.x > 800.0
					i.position.x = 0.0
				end
			}
		end

		def draw
			@clouds.each{|i| i.draw }				
		end
	end
end