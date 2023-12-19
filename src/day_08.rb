class Day08
  attr_accessor :data

  def self.parse_instruction(instructions)
    instructions.map { |instruction| instruction.split("\s") }

  end

  def initialize(instructions)
    @data = self.class.parse_instruction(instructions.split("\n"))
    @not_modified_data = @data
    @visited_instruction = []
    @visited_instruction2 = []
    @corrected_instructions = []
  end

  def boot(debug = false, auto_correct = false)
    acc = instruction_id = 0

    while instruction_id < @data.count
      break if debug && self.debugger(instruction_id)
      acc, instruction_id = [0, 0] if auto_correct && auto_corrector(instruction_id)

      instruction_type, instruction_value = @data[instruction_id]
      if instruction_type == "acc"
        acc += instruction_value.to_i
        instruction_id += 1
      elsif instruction_type == "jmp"
        instruction_id += instruction_value.to_i
      else
        instruction_id += 1
      end
    end

    acc
  end

  def debugger(instruction_id)
    val = @visited_instruction.include?(instruction_id)
    @visited_instruction << instruction_id unless val
    val
  end

  def auto_corrector(instruction_id)
    unless @visited_instruction.include?(instruction_id)
      @visited_instruction << instruction_id
      @visited_instruction2 << instruction_id
      return false
    end
    instructions = @visited_instruction2.select { |visited_instruction_id| ['nop', 'jmp'].include?(@not_modified_data[visited_instruction_id].first) }
    instructions = instructions - @corrected_instructions
    @visited_instruction = []
    @data = @not_modified_data.clone
    @data[instructions.first] = [
      @data[instructions.first][0] == 'nop' ? 'jmp' : 'nop',
      @data[instructions.first][1]
    ]
    @corrected_instructions << instructions.first

    true
  end

  def self.read_file
    return File.read('subject/day_08.txt')
  end
end

obj = Day08.new(Day08.read_file)
obj2 = Day08.new(Day08.read_file)
p obj.boot(true)
p obj2.boot(false, true)
