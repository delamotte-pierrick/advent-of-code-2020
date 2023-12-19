require 'minitest/autorun'
require_relative '../src/day_03.rb'

class Test03 < Minitest::Test
  def setup
    @data = <<-EOL
..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
    EOL

    @data = @data.split("\n")
  end

  def test_right_1_down_1
    assert_equal(2, Day03.petit_papa_noel_mange_du_sapin(@data, 1, 1))
  end

  def test_right_3_down_1
    assert_equal(7, Day03.petit_papa_noel_mange_du_sapin(@data, 3, 1))
  end

  def test_right_5_down_1
    assert_equal(3, Day03.petit_papa_noel_mange_du_sapin(@data, 5, 1))
  end

  def test_right_7_down_1
    assert_equal(4, Day03.petit_papa_noel_mange_du_sapin(@data, 7, 1))
  end

  def test_right_1_down_2
    assert_equal(2, Day03.petit_papa_noel_mange_du_sapin(@data, 1, 2))
  end

  def test_multiple_path
    assert_equal(336, Day03.calc_multiple_path(@data))
  end
end