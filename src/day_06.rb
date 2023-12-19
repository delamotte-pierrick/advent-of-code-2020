class Day06
  def self.sum_response_by_group(data)
    data.split("\n\n").map { |group| group.tr("\n", "").chars.uniq.length }.sum
  end

  def self.sum_response_same_group(data)
    data.split("\n\n").sum { |group| group.split("\n").map { |row| row.chars }.inject(&:&).count }
  end

  def self.read_file
    return File.read('subject/day_06.txt')
  end
end

p Day06.sum_response_by_group(Day06.read_file)
p Day06.sum_response_same_group(Day06.read_file)