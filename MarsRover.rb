class Plateau
	private
		@_maxX = 0
		@_maxY = 0

	public
	def initialize (x ,y)
		@_maxX = x
		@_maxY = y
	end
end



class MarsRover


	private
		@_direction = 0
		@_x = 0
		@_y = 0
		@_plateau = 0

		def ChangeDirection (rotate)
			case rotate
				when 'R': @_direction =  @_direction == 0 ? @_direction = 3: @_direction - 1
				when 'L': @_direction =  @_direction == 3 ? @_direction = 0: @_direction + 1
			end
		end
		def Action (action)
			if action == 'M'
				MoveTo (@_direction)
			else
				ChangeDirection(action)
			end

		end

		def MoveTo (moveDirection)
			case moveDirection
				when 0: @_y += 1
				when 2: @_y -= 1
				when 1: @_x -= 1
				when 3: @_x += 1
			end
		end



	public
		def initialize (x, y, direction, plateau)
			@_x = x
			@_y = y
			case direction
				when 'N':  @_direction = 0
				when 'W':  @_direction = 1
				when 'S':  @_direction = 2
				when 'E':  @_direction = 3
			end
			@_plateau = plateau
		end

		def Move (movement)
			movement.upcase.split('').each do |symbol|
				Action(symbol)
			end
		end

		def ShowPosition ()
			@position = @_x.to_s + ", " + @_y.to_s + " "
			case @_direction
				when 0: @position+= 'N'
				when 1: @position+= 'W'
				when 2: @position+= 'S'
				when 3: @position+= 'E'
			end
			puts @position
		end

end

pl = Plateau.new(5,5)
rover1 = MarsRover.new(1,2,'N',pl)
rover1.Move("LMLMLMLMM")
rover1.ShowPosition

rover2 = MarsRover.new(3,3,'E',pl)
rover2.Move("MMRMMRMRRM")
rover2.ShowPosition

