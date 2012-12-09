module Airstrike
	class ParticleSystem

		attr_accessor :particles, :count, :position, :capacity, :current, :duration, :interval, :amount

		def initialize texture, capacity = 128
			# TODO: init
			@position = CENTER.clone
			@particles = []
			@capacity = capacity
			@capacity.times do |i|
				@particles.push(Particle.new(texture, 500 + rand() * 1000)
					.set_position(@position.x, @position.y)
					.set_velocity(-0.5 + rand(), -0.5 + rand())
				)
			end
			@count = 0
			@current = 0.0
			@interval = 300
			@amount = 5
		end

		def spawn
			@amount.times do |i|
				p = @particles[@count]
				@count += 1

				p.reset()
				p.set_position(@position.x, @position.y)
				 .set_velocity(-0.5 + rand(), -0.5 + rand())

			end
		end

		def delete_particle index
			@particles[index], @particles[@count - 1] = @particles[@count - 1], @particles[index]
			@count -= 1
		end

		def update dt
			@count.times do |i|
				p = @particles[i]
				p.current += dt
				p.update dt
				if p.current > p.duration
					delete_particle i
					i -= 1
				end
			end
			@current += dt
			if @current > @interval
				spawn
				@current = 0.0
			end
		end		
		
		def draw
			@count.times do |i|
				p = @particles[i]
				p.draw
			end
		end
	end
end