module Minitest
  module Failed
    class IO
      class << self
        def read_from_file
          File.read(config.file_path) if File.exist?(config.file_path)
        end

        def write_to_file(results)
          content = results.join("\n")
          File.write(config.file_path, content)
        end

        def config
          ::Minitest::Failed.config
        end
      end
    end
  end
end
