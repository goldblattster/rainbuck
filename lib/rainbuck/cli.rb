require 'rainbuck/shell'

class Rainbuck::CLI
  def self.go(*args)
    options = []
    commands = []

    args.each do |arg|
      if arg[0,1] == '-'
        options << arg
      else
        commands << arg
      end
    end

    if commands.length == 0
      shell = Rainbuck::Shell
    end
  end
end