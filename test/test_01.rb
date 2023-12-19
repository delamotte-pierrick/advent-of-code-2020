require 'minitest/autorun'
require_relative '../src/day_01.rb'

class Test01 < Minitest::Test
  def test_simple
    data = [1721, 979, 366, 299, 675, 1456]
    assert_equal(514579, Day01.sum_entries(data))
  end

  def test_recursive
    data = [1721, 979, 366, 299, 675, 1456]
    assert_equal(241861950, Day01.recursive_sum_entries(data))
  end
end