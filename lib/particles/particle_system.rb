module Airstrike
	class ParticleSystem

		attr_accessor :particles, :count, :position, :rotation, :capacity, :current, :duration, :interval, :amount

		def initialize texture, capacity = 128
			# TODO: init
			@position = CENTER.clone
			@particles = []
			@capacity = capacity
			@capacity.times do |i|
				@particles.push Particle.new(self, texture, 1000)
			end
			@count = 0
			@current = 0.0
			@interval = 300
			@amount = 5
			@rotation = 0.0
		end

		def move new_position
			@position.x, @position.y = new_position.x, new_position.y
		end

		def rotate_to rotation
			@rotation = rotation
		end

		def spawn
			@amount.times do |i|
				p = pop
				p.set_velocity(-0.5 + rand(), -0.5 + rand())
			end
		end

		def pop
			particle = @particles[@count]
			@count += 1
			particle.reset()
			particle.set_position(@position.x, @position.y)
			particle
		end

		def push index
			@particles[index], @particles[@count - 1] = @particles[@count - 1], @particles[index]
			@count -= 1
		end

		def update dt
			@count.times do |i|
				p = @particles[i]
				p.current += dt
				p.update dt
				if p.current > p.duration
					push i
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