class Day09
  attr_accessor :data

  def initialize(data, preamble_length)
    @data = data.split("\n").map(&:to_i)
    @preamble_length = preamble_length
  end

  def self.read_file
    return File.read('subject/day_09.txt')
  end

  def first_not_valid_number
    @data.select.with_index { |element, index| index >= @preamble_length && !@data[(index - @preamble_length)...index].combination(2).map(&:sum).include?(element) }.first
  end

  def brok_code
    invalid_number = first_not_valid_number
    maximum_index = @data.find_index(invalid_number)
    (0...maximum_index).each do |key|
      (1...maximum_index).each do |max_sub|
        sub = @data[key..max_sub+key]
        break if sub.sum > invalid_number
        return (sub.min + sub.max) if sub.sum == invalid_number
      end
    end
  end

  def brok_code_v2
    invalid_number = first_not_valid_number
    maximum_index = @data.find_index(invalid_number)
    min, max = [0, 0]
    i = 0
    while max < maximum_index
      i += 1
      range = @data[min..max]
      min += 1 if range.sum > invalid_number
      max += 1 if range.sum < invalid_number
      if range.sum == invalid_number
        puts i
      end
      return range.min + range.max if range.sum == invalid_number
    end
  end
end

p Day09.new(Day09.read_file, 25).first_not_valid_number
p Day09.new(Day09.read_file, 25).brok_code
p Day09.new(Day09.read_file, 25).brok_code_v2
