class MarsRover

	def initialize(x, y, direction, plateue)
    @position = {:x => x, :y => y}
    @directions = %w"N W S E"
    @direction = @directions.index direction
    @plateue = plateue
    @actions = {'R' => lambda { @direction = (@direction -= 1 + 4)%4 },
                'L' => lambda { @direction = (@direction += 1 + 4)%4 },
                'M' => lambda { @actions[@directions[@direction]].call },
                'N' => lambda { @position[:y] += 1 if @position[:y] < @plateue[1] - 1},
                'W' => lambda { @position[:x] -= 1 if @position[:x] > 1},
                'S' => lambda { @position[:y] -= 1 if @position[:y] > 1},
                'E' => lambda { @position[:x] += 1 if @position[:x] < @plateue[0] - 1}}
  end

  def move(movement)
  	movement.upcase.split('').each { |symbol| @actions[symbol].call }
	end

	def position
	  [@position[:x], @position[:y], @directions[@direction]].join " "
	end

end

if ARGV.empty?
  p "There is no input file"
  return
end

output = File.open(ARGV[1], "w") if ARGV[1]

File.open(ARGV[0], "r") do |infile|
  plateue = infile.gets.split(" ").map {|x| x.to_i}
  while (line = infile.gets)
    x, y, direction = line.split " "
    rover = MarsRover.new x.to_i, y.to_i, direction, plateue
    rover.move infile.gets.delete("\n")

    p rover.position
    output.write rover.position + "\n" if output
  end
end

output.close if output

