module Airstrike
	def Airstrike.load_image game_window, name
		Gosu::Image.new(game_window, "#{GFX_PATH}#{name}.png")
	end

	def Airstrike.to_degrees radiens
		radiens * 180 / Math::PI
	end

	def Airstrike.to_radians radiens
		radiens * 180 / Math::PI
	end

	def Airstrike.wrap_angle(angle)
		while angle > Airstrike::to_radians(360.0)
			angle -= Airstrike::to_radians(360.0)
		end
		while angle < 0.0
			angle += Airstrike::to_radians(360.0)
		end
		angle
	end

	# linear interpolation
	def Airstrike.lerp x, y, w
		x + (y - x) * w		
	end

	# cubic interpolation using a hermite spline
	def Airstrike.qlerp(min, max, weight)
		hermite(min, 0.0, max, 0.0, weight)
	end

	# value1, tangent1, value2, tangent2
	def Airstrike.hermite(v1, t1, v2, t2, weight)
		sCubed = weight * weight * weight
		sSquared = weight * weight
		result = 0.0
		if weight == 0.0
			result = v1
		elsif weight == 1.0
			result = v2
		else
			result = (2 * v1 - 2 * v2 + t2 + t1) * sCubed + (3 * v2 - 3 * v1 - 2 * t1 - t2) * sSquared + t1 * weight + v1
		end
	    result
	end
end