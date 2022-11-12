# module to handle conter functionality
module Wc::Counter

    # character counter mixin
    module CharacterCounter
        abstract def get_content: String

        # impl count
        def count_chars
            get_content.size
        end
    end

    # word counter mixin
    module WordCounter
        abstract def get_content: String

        # impl count
        def count_words
            words = [] of String
            get_content.strip.split { |str| words << str }
            words.size
        end
    end

    # word counter mixin
    module LineCounter
        abstract def get_content: String

        # impl count
        def count_line
            lines = [] of String
            get_content.split("\n") { |str| lines << str }
            lines.size
        end
    end

    # interface and default impl
    class FileItemCounter

        # include mixins
        include CharacterCounter
        include WordCounter
        include LineCounter

        # construct an object
        def initialize(fc : String)
            @fcontent = fc
        end

        # Create from filename
        def from_filename(fname : String)
            fcontent = File.read(fname)
            FileItemCounter.new(fcontent)
        end

        def get_content: String
            @fcontent
        end
    end
end
