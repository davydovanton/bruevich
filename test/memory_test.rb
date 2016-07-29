require 'test_helper'

describe Bruevich::Memory do
  describe '#current_value' do
    it 'returns kb of current memory used' do
      memory = Bruevich::Memory.new
      memory.current_value.must_be_kind_of Integer
    end
  end
end
