class Day01
  def self.sum_entries(entries)
    entries.each do |entry|
      entries.each do |subEntry|
        entry = entry.to_i
        subEntry = subEntry.to_i
        return entry * subEntry if (entry + subEntry) == 2020
      end
    end
    return "impossible"
  end

  def self.recursive_sum_entries(entries)
    entries.combination(3).select { |entry| entry.sum == 2020 }.first.inject(:*)
  end

  def self.read_file
    return File.readlines('subject/day_01.txt').split
  end
end