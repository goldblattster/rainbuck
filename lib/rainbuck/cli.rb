require 'rainbuck/shell'
require 'rainbuck/script'
require 'rainbuck/brainfuck'

class Rainbuck::CLI
  def self.go(args)
    options = []
    commands = []

    args.each do |arg|
      puts arg

      if arg[0,1] == '-'
        options << arg
      else
        commands << arg
      end
    end

    if commands.length == 0
      Rainbuck::Shell.go
    else
      if File.exist?(args[0])
        script_interpreter = Rainbuck::Script args[0]
        script_interpreter.go
      else
        Rainbuck::Brainfuck.eval args[0]
      end
    end
  end
end
