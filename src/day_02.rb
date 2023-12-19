class Day02
  def self.is_valid_password_policies(row)
    min_max, letter, password = row.split(' ')
    min, max = min_max.split('-')
    letter = letter.delete(':')

    return password.count(letter).between?(min.to_i, max.to_i)
  end

  def self.is_valid_password_policies_by_position(row)
    min_max, letter, password = row.split(' ')
    min, max = min_max.split('-').map { |value| value.to_i - 1 }
    letter = letter.delete(':')

    return (password[min] == letter) ^ (password[max] == letter)
  end

  def self.count_valid_password_by_position
    data = self.read_file
    # for row in data
    data.select { |row| self.is_valid_password_policies_by_position(row) }.count
  end

  def self.count_valid_password
    data = self.read_file
    # for row in data
    data.select { |row| self.is_valid_password_policies(row) }.count
  end

  def self.read_file
    return File.readlines('subject/day_02.txt')
  end
end

puts Day02.count_valid_password_by_position