class Rover

  def initialize
    @x = 0
    @y = 0
    @direction = 0 # => north
  end

  def start_coord(x, y)
    @x = x
    @y = y
  end

  def eval_dir
    #declare coordinates
    if @direction == 0
      @direct = "NORTH"
    elsif @direction == 1
      @direct = "EAST"
    elsif @direction == 2
      @direct = "SOUTH"
    elsif @direction == 3
      @direct = "WEST"
    end
  end

  def read_instruction(input)
    #strips input chars into array
    @input = input.chars
  end

  def turn_move
    @input.each do |k|
      #for R/r input
      if k == "R" || k == 'r'
        #turn right
        @direction += 1

        #reset direction to 0 if >3
        if @direction > 3
          @direction = 0
        end
        eval_dir

      #for L/l input
      elsif k == "L" || k == 'l'
        #turn left
        @direction -= 1

        #reset direction to 3 if < 0
        if @direction < 0
          @direction = 3
        end
        eval_dir

      #for M/m input
      elsif k == "M" || k == 'm'
        #move north
        if @direction == 0 && @y < 9
          @y += 1

        #move east
        elsif @direction == 1 && @x < 9
          @x += 1

        #move south
        elsif @direction == 2 && @y > 0
          @y -= 1

        #move west
        elsif @direction == 3 && @x > 0
          @x -= 1
        end
      end
    end
  end

  def rover_status
    puts "\nYEEEEE IM ON COORDINATE [#{@x}, #{@y}] FACING #{@direct} SUCKAZZZ."
  end

end

boop = Rover.new

puts "To turn your rover on, enter 'y'"
start = gets.chomp

unless start == "y"
  puts "I didn't catch that."
  puts "To turn your rover on, enter 'y'"
  start = gets.chomp
end
puts "\nVROOM VROOM IM A ROVER"
puts "WHERE DO YOU WANT ME TO START LOL"
puts "\n** the rover will be moving around a 9x9 plateau on... you guessed it, MARS."
puts "** enter the x-coordinate you'd like to start on (0-9):"
  x_start = gets.chomp.to_i
puts "** enter the y-coordinate you'd like to start on (0-9):"
  y_start = gets.chomp.to_i
  boop.start_coord(x_start, y_start)

puts "** if you ever wanna turn off this obnoxious rover, enter 'off' or 'stop'"
puts "\nALRIGHT LETS FLY AROUND NOW WOOOOOO"

while true
  puts "\n** enter a combination of L (turn left), R (turn right), and M (move 1 space) to fly around."
  input = gets.chomp

  if input == "off" || input == "stop"
    puts "\nNOOOO I WANNA KEEP ROVER-INNGGGGGgggg *blip*"
    break
  end

  boop.read_instruction(input)
  boop.turn_move
  puts boop.rover_status
  puts "ALRIGHT WHERE TO NEXT SPACE COWBOYYYYY"
end


# a = "fdfjdasl"
# b = a.chars
# puts b


# def move
#   if k == "M" || k == 'm'
#     if @direction == 0 && @y < 9
#       @direct = "N"
#       @y += 1
#     elsif @direction == 1 && @x < 9
#       @direct = "E"
#       @x += 1
#     elsif @direction == 2 && @y > 0
#       @direct = "S"
#       @y -= 1
#     elsif @direction == 3 && @x > 0
#       @direct = "W"
#       @x -= 1
#     end
#   end
# end
