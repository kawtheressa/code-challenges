class Robot
  def initialize
    @x = 0
    @y = 0
    @direction = 'North'
  end

  def move_forward
    case @direction
    when 'North'
      @y += 1
    when 'East'
      @x += 1
    when 'South'
      @y -= 1
    when 'West'
      @x -= 1
    end
  end

  def turn_left
    @direction = case @direction
                 when 'North' then 'West'
                 when 'West' then 'South'
                 when 'South' then 'East'
                 when 'East' then 'North'
                 end
  end

  def turn_right
    @direction = case @direction
                 when 'North' then 'East'
                 when 'East' then 'South'
                 when 'South' then 'West'
                 when 'West' then 'North'
                 end
  end

  def get_status
    "Robot at position [#{@x},#{@y}] facing #{@direction}"
  end
end

def main
  robot = Robot.new
  puts "Welcome to the Robot console. Type '?' for available commands."

  loop do
    print "Enter command: "
    command = gets.chomp.upcase

    case command
    when 'M'
      robot.move_forward
    when 'L'
      robot.turn_left
    when 'R'
      robot.turn_right
    when '?'
      puts "Available commands:"
      puts "M - Move robot forward"
      puts "L - Turn robot left"
      puts "R - Turn robot right"
      puts "? - Show available commands"
      puts "Q - Exit the robot console"
    when 'Q'
      puts "Exiting..."
      break
    else
      puts "Invalid command. Type '?' for available commands."
    end

    puts robot.get_status
  end
end

if __FILE__ == $PROGRAM_NAME
  main
end
