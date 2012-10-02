require 'pathname'

me = Pathname.new(__FILE__).realpath
$:.unshift File.expand_path('../../lib', me)

require 'rainbuck/cli'

module Rainbuck; end

if __FILE__ == $0
  Rainbuck::CLI.go(ARGV)
end