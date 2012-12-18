module Airstrike
	class Game

		attr_accessor :game_window

		def initialize(game_window)
			@game_window = game_window
			@background_color = Gosu::blue
			@background_color.red = 100
			@background_color.green = 150

			@ground_pieces = []
			@ground_pieces << Entity.new(Airstrike::load_image(@game_window, 'ground'))
				.set_position(WIDTH / 2.0, HEIGHT - (24 / 2.0))

			@clouds = Clouds.new(Airstrike::load_image(@game_window, 'cloud'))

			@tank = Tank.new(Airstrike::load_image(@game_window, 'tank'))
				.set_velocity(-0.1, 0.0)
				.set_position(800, HEIGHT - 64)
				.set_scale(0.3)

			@arcs = []
			@arc_factory = ArcFactory.new

			@blob_yellow = Airstrike::load_image(@game_window, 'blob_yellow')
			@cursor = Entity.new Airstrike::load_image(@game_window, 'blob_yellow')


			@missile = Missile.new Airstrike::load_image(@game_window, 'missile'), Airstrike::load_image(@game_window, 'blob_yellow')
			@missile.set_scale 0.3
		end

		def update(dt)
			@clouds.update dt
			@tank.update dt

			@cursor.set_position(@game_window.mouse_x, @game_window.mouse_y)

			if @game_window.button_down? Gosu::MsLeft
				@arc_factory.start Vec2.new(@game_window.mouse_x, @game_window.mouse_y) unless @arc_factory.started?
				@arc_factory.move @game_window.mouse_x, @game_window.mouse_y
			else
				@arcs << @arc_factory.done if @arc_factory.started?
			end

			@missile.update dt
		end

		def draw
			@game_window.clear(@background_color)
			@clouds.draw

			@tank.draw
			@ground_pieces.each{ |i| i.draw }

			@arcs.each{ |a| a.draw @blob_yellow }

			#@particle_system.draw
			
			@arc_factory.draw_preview @blob_yellow

			@missile.draw

			@cursor.draw
		end
	end
end