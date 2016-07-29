require 'test_helper'

describe Bruevich::Bench do
  let(:bench) { Bruevich::Bench.new }
  let(:iterations) { [1, 10] }
  let(:result) do
    {
      title: 'test bench',
      1 => {
        time: {
          per_iteration: [0.1, 0.2, 0.3],
          total: 0.6,
          average: 0.2
        },
        mem: {
          per_iteration: [1, 2, 3],
          total: 6,
          average: 2
        }
      },

      10 => {
        time: {
          per_iteration: [1.0, 2.0, 3.0],
          total: 6.0,
          average: 2.0
        },
        mem: {
          per_iteration: [10, 20, 30],
          total: 60,
          average: 20
        }
      }
    }
  end

  describe '::ITERATIONS' do
    it 'returns default iteration counts' do
      Bruevich::Bench::ITERATIONS.must_equal [1, 10, 50, 100, 150]
    end
  end


  describe 'private' do
    describe '#initialize_result' do
      it 'sets empty data set for count in result hash' do
        bench.result.must_equal({})

        bench.send(:initialize_result, 1)

        bench.result.must_equal({ 1 => { time: { full: [] }, mem: { full: [] } } })
      end
    end

    describe '#memory' do
      it 'returns instance of Memory' do
        bench.send(:memory).must_be_instance_of Bruevich::Memory
      end
    end
  end
end
