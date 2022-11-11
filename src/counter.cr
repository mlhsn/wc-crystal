# module to handle conter functionality
module Counter

    # interface and default impl
    abstract class FileitemCounter

        # construct an object
        def initialize(fc : String)
            @file_content = fc
        end

        # Create from filename
        def from_filename(fname : String)
            FileitemCounter.new fname
        end
    end
end
