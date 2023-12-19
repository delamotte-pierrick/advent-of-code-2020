require 'yaml'

class Day04
  def self.valid_passport(passport)
    return (passport.length == 8 || (passport.length == 7 && !passport.key?('cid')))
  end

  def self.valid_passport_2(passport)
    result = (passport.length == 8 || (passport.length == 7 && !passport.key?('cid'))) &&
      passport['byr'].to_i.between?(1920, 2002) &&
      passport['iyr'].to_i.between?(2010, 2020) &&
      passport['eyr'].to_i.between?(2020, 2030) &&
      passport['hgt'].match?(/^((1([5-8]\d|9[0-3])cm)|((59|6\d|7[0-6])in))$/) &&
      passport['hcl'].match?(/^#(\d|[a-f]){6}$/) &&
      ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include?(passport['ecl']) &&
      passport['pid'].match?(/^\d{9}$/)

    result
  end

  def self.decode_passports(batch)
    passports_encoded = batch.split("\n\n")
    passports = passports_encoded.map do |passport_encoded|
      passport_encoded.split("\s").each_with_object({}) do |row, passport|
        key, value = row.split(':')
        passport[key] = value
      end
    end

    passports
  end

  def self.valid_all_passports(subject)
    self.decode_passports(subject).select { |passport| self.valid_passport(passport) }.count
  end

  def self.valid_all_passports_2(subject)
    self.decode_passports(subject).select { |passport| self.valid_passport_2(passport) }.count
  end

  def self.read_file
    return File.read('subject/day_04.txt')
  end
end

puts Day04.valid_all_passports(Day04.read_file)
puts Day04.valid_all_passports_2(Day04.read_file)