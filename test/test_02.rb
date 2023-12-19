require 'minitest/autorun'
require_relative '../src/day_02.rb'

class Test02 < Minitest::Test
  def test_one_to_three_a
    data = "1-3 a: abcde"
    assert_equal(true, Day02.is_valid_password_policies(data))
  end

  def test_one_to_three_b
    data = "1-3 b: cdefg"
    assert_equal(false, Day02.is_valid_password_policies(data))
  end

  def test_one_to_three_c
    data = "2-9 c: ccccccccc"
    assert_equal(true, Day02.is_valid_password_policies(data))
  end

  def test_one_to_three_a_by_position
    data = "1-3 a: abcde"
    assert_equal(true, Day02.is_valid_password_policies_by_position(data))
  end

  def test_one_to_three_b_by_position
    data = "1-3 b: cdefg"

    assert_equal(false, Day02.is_valid_password_policies_by_position(data))
  end

  def test_one_to_three_c_by_position
    data = "2-9 c: ccccccccc"

    assert_equal(false, Day02.is_valid_password_policies_by_position(data))
  end
end