class Day03
  # def self.petit_papa_noel_mange_du_sapin(subject, right, down)
  #   length_row = subject.first.length
  #   current_down = down-=1
  #   position = tree = 0
  #
  #   subject.drop(1).each do |row|
  #     (current_down-=1) && next if current_down > 0
  #     current_down = down if current_down == 0
  #
  #     position = (position + right) % length_row
  #     tree += 1 if row[position] == "#"
  #   end
  #
  #   tree
  # end

  def self.petit_papa_noel_mange_du_sapin(subject, right, down)
    length_row = subject.first.length
    current_down = down-=1
    position = 0

    subject.drop(1).select do |row|
      (current_down-=1) && next if current_down > 0
      current_down = down if current_down == 0

      position = (position + right) % length_row

      row[position] == "#"
    end.count
  end

  def self.read_file
    return File.read('subject/day_03.txt').split("\n")
  end

  def self.calc_multiple_path(subject)
    [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
      .map { |right, down| self.petit_papa_noel_mange_du_sapin(subject, right, down) }
      .inject(1, &:*)
  end
end

# subject = Day03.read_file
# puts Day03.calc_multiple_path(subject)