class Rainbuck::Shell
  def initialize()
    @lines = 0
    go
  end

  def go
    #TODO: actually do stuff with line
    $stdout.print "rainbuck:#{lines} | => "

    $stdin.each_line do |line|
      @lines += 1

      pid = fork do
        exec line
      end

      Process.wait pid
      $stdout.print "rainbuck:#{lines} | => "
    end
  end
end