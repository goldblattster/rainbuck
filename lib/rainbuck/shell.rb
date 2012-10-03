require 'rainbuck'

class Rainbuck::Shell
  def self.go()
    lines = 0

    $stdout.print "|rainbuck|:#{sprintf '%03d', lines} => "

    $stdin.each_line do |line|
      lines += 1
      Rainbuck::Brainfuck.eval line

      $stdout.print "|rainbuck|:#{sprintf '%03d', lines} => "
    end
  end
end