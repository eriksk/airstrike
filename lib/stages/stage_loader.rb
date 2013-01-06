require 'json'
module Airstrike
	class StageLoader

		def self.load(game_window, name)
			stage = nil
			File.open("#{CONTENT_PATH}/stages/#{name}.json", "r") do |f|
				stage = JSON.parse f.read
			end
			create_stage_from_json(game_window, stage)
		end

		private
		def self.create_stage_from_json(game_window, json)
			name = json['name']
			planes = json['planes']
			enemies = json['enemies']
			setting = json['setting']
			stop = json['stop'].to_f

			puts "Loading stage #{name}..."

			stage = Stage.new
			stage.load(game_window, stop)

			planes.each do |plane|
				start_x =  plane['start']['x'].to_i
				start_y =  plane['start']['y'].to_i
				end_x =  plane['end']['x'].to_i
				end_y =  plane['end']['y'].to_i
				stage.add_plane(game_window, start_x, start_y, end_x, end_y)
			end

			enemies.each do |e|
				x = e['x'].to_i
				y = e['y'].to_i
				type = e['type']
				stage.add_enemy(game_window, type, x, y)
			end

			puts "done"
			stage
		end
	end
end