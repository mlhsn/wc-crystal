require "option_parser"
require "./counter"

# Main driver code for Wc
module Wc
  # current asked response type
  asked_response_type: ResponseType = ResponseType::ALL

  # Type of response asked
  enum ResponseType
    CHAR
    WORD
    LINE
    ALL
  end

  OptionParser.parse do |parser|
    parser.banner = "Welcome to *nix wc clone. Written in Crystal-lang.org for education."

    # Version option
    parser.on "-v", "--version", "Shows version" do
      puts "version 1.0"
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

  c = Wc::Counter::FileItemCounter.new(ARGF.gets_to_end)
  puts "#{c.count_chars}\t#{c.count_words}\t#{c.count_line}"
end
