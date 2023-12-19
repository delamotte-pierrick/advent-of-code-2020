require 'minitest/autorun'
require_relative '../src/day_09.rb'

class Test09 < Minitest::Test
  def setup
    @data = <<-EOL
35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
EOL
  end

  def test_not_a_sum_of_two_previous_five_number
    assert_equal(127, Day09.new(@data, 5).first_not_valid_number)
  end

  def test_brok_code
    assert_equal(62, Day09.new(@data, 5).brok_code)
  end

  def test_brok_code_v2
    assert_equal(62, Day09.new(@data, 5).brok_code)
  end
end