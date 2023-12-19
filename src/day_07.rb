class Day07
  attr_accessor :data

  def initialize(rules)
    @data = self.class.parse_rules(rules)
  end

  def who_can_directly_contain(color)
    @data.each_with_object([]) do |(colorName, colorChildren), memo|
      memo << colorName if colorChildren.select { |element| element.keys.first == color }.count != 0
    end
  end

  def who_can_contain(color)
    result = []
    precedent_result = [color]
    while precedent_result.count != 0
      result.concat(precedent_result)
      precedent_result = precedent_result.inject([]) { |memo, search_color| memo << who_can_directly_contain(search_color) }.flatten.uniq
    end

    result.delete(color)
    result.uniq
  end

  def how_many_can_contain(color)
    return 1 if @data[color].count == 0 #If no child return himself
    @data[color].map { |child| how_many_can_contain(child.to_a[0][0]) * child.to_a[0][1] }.inject(&:+) + 1
  end

  def self.parse_rules(rules)
    rules.split("\n").inject({}) do |memo, rule|
      parent_color = rule.scan(/^([\s\w]+)\sbags\scontain/)
      children_color = rule.scan(/(\d)\s([\s\w]+)\sbags?/)

      memo.store(parent_color.first.first, children_color.inject([]) { |colors, childColor| colors << {childColor[1] => childColor[0].to_i} unless childColor.nil? })
      memo
    end
  end

  def self.read_file
    return File.read('subject/day_07.txt')
  end
end

obj = Day07.new(Day07.read_file)
p obj.who_can_contain('shiny gold').count
p obj.how_many_can_contain('shiny gold') - 1