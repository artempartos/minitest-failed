module Minitest
  module Failed
    require 'minitest'
    require 'minitest/failed/version'
    require 'minitest/failed/config'
    require 'minitest/failed/file_reporter'
    require 'minitest/failed/io'

    def self.get_files_and_tests
      string = IO.read_from_file

      return nil unless string

      array = string.split(/rake|TEST=| TESTOPTS=|\"|\\|--name=/).map(&:strip).reject(&:empty?)
      array.partition { |v| v.end_with?('rb') }
    end

    def self.configure
      @config = Minitest::Failed::Config.new
      yield @config
    end

    def self.config
      @config ||= Minitest::Failed::Config.new
    end

  end
end
