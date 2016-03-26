require 'optparse'

module Saltspec
  class Options
    def self.new(args)
      options = {}

      OptionParser.new do |opts|
        opts.banner = "Usage: example.rb [options]"

        opts.on("-f", "--format FORMAT", "Formatter") do |v|
          options[:format] = v
        end

        opts.on("-l", "--log-level LEVEL", "Log level") do |v|
          options[:log_level] = v
        end

        opts.on("-c", "--[no-]color", "Color output") do |v|
          options[:color] = v
        end
      end.parse!(args)

      options
    end
  end
end
