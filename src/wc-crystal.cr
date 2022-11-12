require "option_parser"
require "./counter"

# Main driver code for Wc
module Wc
  # current asked response type
  response_opt: ResponseType = ResponseType::ALL

  # Type of response asked
  enum ResponseType
    CHAR
    WORD
    LINE
    ALL
  end

  OptionParser.parse do |parser|
    parser.banner = "Welcome to *nix wc clone. Written in Crystal-lang.org for education."

    # Show char count
    parser.on "-c", "--char", "Shows counter for characters" do
      response_opt = ResponseType::CHAR
    end

    # # Show word count
    parser.on "-w", "--word", "Shows counter for words" do
      response_opt = ResponseType::WORD
    end

    # # Show line count
    parser.on "-l", "--line", "Shows counter for lines" do
      response_opt = ResponseType::LINE
    end

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

  case response_opt

  when ResponseType::CHAR
    puts "#{c.count_chars}\r\n"

  when ResponseType::WORD
    puts "#{c.count_words}\r\n"

  when ResponseType::LINE
    puts "#{c.count_line}\r\n"
  else
    puts "#{c.count_chars}\t#{c.count_words}\t#{c.count_line}\r\n"
  end
end
