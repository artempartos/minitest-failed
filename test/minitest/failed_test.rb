require 'test_helper'

class Minitest::FailedTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Minitest::Failed::VERSION
  end
end
