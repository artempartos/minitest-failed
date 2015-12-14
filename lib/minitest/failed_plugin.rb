require 'minitest/failed'

module Minitest
  def self.plugin_failed_init(options)
    reporters = Minitest.reporter.reporters
    reporters << Minitest::Failed::FileReporter.new(options)
  end
end
