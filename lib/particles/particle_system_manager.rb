module Airstrike
	class ParticleSystemManager

		# TODO: test this class
		attr_accessor :particle_systems

		def initialize
			@particle_systems = []	
		end
		
		def update dt
			@particle_systems.each do |ps|
				ps.update dt
				if ps.done?
					@particle_systems.remove ps
				end
			end
		end		

		def draw
			@particle_systems.each do |ps|
				ps.draw
			end
		end
	end
end