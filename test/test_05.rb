require 'minitest/autorun'
require_relative '../src/day_05.rb'

class Test05 < Minitest::Test
  def test_decode_row_with_BFFFBBFRRR
    assert_equal(70, Day05.decode_row('BFFFBBF'.chars))
  end

  def test_decode_row_with_FFFBBBFRRR
    assert_equal(14, Day05.decode_row('FFFBBBF'.chars))
  end

  def test_decode_row_with_BBFFBBFRLL
    assert_equal(102, Day05.decode_row('BBFFBBF'.chars))
  end


  def test_decode_column_with_BFFFBBFRRR
    assert_equal(7, Day05.decode_column('RRR'.chars))
  end

  def test_decode_column_with_FFFBBBFRRR
    assert_equal(7, Day05.decode_column('RRR'.chars))
  end

  def test_decode_column_with_BBFFBBFRLL
    assert_equal(4, Day05.decode_column('RLL'.chars))
  end


  def test_decode_seat_with_BFFFBBFRRR
    assert_equal(567, Day05.decode_seat('BFFFBBFRRR'))
  end

  def test_decode_seat_with_FFFBBBFRRR
    assert_equal(119, Day05.decode_seat('FFFBBBFRRR'))
  end

  def test_decode_seat_with_BBFFBBFRLL
    assert_equal(820, Day05.decode_seat('BBFFBBFRLL'))
  end

  def test_find_hightest_seat
    data = <<-EOL
BFFFBBFRRR
FFFBBBFRRR
BBFFBBFRLL
EOL
    assert_equal(820, Day05.find_highest_seat(data.split("\n")))
  end
end