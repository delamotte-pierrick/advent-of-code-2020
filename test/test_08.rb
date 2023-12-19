require 'minitest/autorun'
require_relative '../src/day_08.rb'

class Test08 < Minitest::Test
  def setup
    @data = <<-EOL
nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
EOL
  end

  def test_boot_debugger
    assert_equal(5, Day08.new(@data).boot(true))
  end

  def test_boot_auto_correct
    assert_equal(8, Day08.new(@data).boot(false , true ))
  end
end