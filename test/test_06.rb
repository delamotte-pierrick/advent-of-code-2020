require 'minitest/autorun'
require_relative '../src/day_06.rb'

class Test06 < Minitest::Test
  def setup
    @data = <<-EOL
abc

a
b
c

ab
ac

a
a
a
a

b
EOL
  end

  def test_sum_response_by_group
    assert_equal(11, Day06.sum_response_by_group(@data))
  end

  def test_sum_response_same_group
    assert_equal(6, Day06.sum_response_same_group(@data))
  end
end