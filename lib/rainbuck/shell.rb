require 'rainbuck'

class Rainbuck::Shell
  def initialize()
    @lines = 0
    
    #TODO: actually do stuff with line
    $stdout.print "rainbuck:#{lines} | => "

    $stdin.each_line do |line|
      @lines += 1
      Rainbuck::Brainfuck.eval(line)
      $stdout.print "rainbuck:#{lines} | => "
    end
  end
end