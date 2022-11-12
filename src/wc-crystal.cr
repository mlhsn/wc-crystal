require "option_parser"
require "./counter"

# Main driver code for Wc
module Wc
  VERSION = "1.0"

  OptionParser.parse do |parser|
    parser.banner = "Welcome to *nix wc clone. Written in Crystal-lang.org for education."

    # Version option
    parser.on "-v", "--version", "Shows version" do
      puts "version #{VERSION}"
      exit
    end

    # Help option
    parser.on "-h", "--help", "Shows list of all arguments and options available" do
      puts parser
      exit
    end

    # fallback
    parser.invalid_option do |flag|
      STDERR.puts "ERROR: #{flag} is not a valid option."
      STDERR.puts parser
      exit(1)
    end
  end

  # cc = Wc::Counter::CharacterCounter.new ARGF.gets_to_end
  cc = Wc::Counter::WordCounter.new ARGF.gets_to_end
  puts cc.count
end
