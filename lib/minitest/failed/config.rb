module Minitest
  module Failed
    class Config
      attr_accessor :file_path

      def file_path
        @file_path ||= './tmp/.minitest-failed'
      end
    end
  end
end
