# module to handle conter functionality
module Wc::Counter

    # interface and default impl
    abstract class FileItemCounter

        # construct an object
        def initialize(fc : String)
            @file_content = fc
        end

        # Create from filename
        def from_filename(fname : String)
            fcontent = File.read(fname)
            FileItemCounter.new(fcontent)
        end

        abstract def count
    end

    # character counter
    class CharacterCounter < FileItemCounter

        # impl count
        def count
            @file_content.size
        end
    end

    # word counter
    class WordCounter < FileItemCounter

        # impl count
        def count
            words = [] of String
            @file_content.strip.split { |str| words << str }
            words.size
        end
    end
end
