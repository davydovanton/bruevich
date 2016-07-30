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

  describe '#iterations' do
    describe 'when instance value set' do
      it 'returns instance value' do
        bench.iterations = [1]
        bench.iterations.must_equal [1]
      end
    end

    describe 'when instance value not set' do
      it 'returns ITERATIONS' do
        bench.iterations.must_equal Bruevich::Bench::ITERATIONS
      end
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

    describe '#calculate' do
      it 'sets average and totat time and memory values to result' do
        bench.send(:initialize_result, 3)
        bench.iterations = [3]

        bench.result[3][:time][:full] = [0.1, 0.2, 0.3]
        bench.result[3][:mem][:full] = [1, 2, 3]

        bench.send(:calculate)

        bench.result[3][:time][:total].round(1).must_equal 0.6
        bench.result[3][:time][:average].round(1).must_equal 0.2

        bench.result[3][:mem][:total].must_equal 6
        bench.result[3][:mem][:average].must_equal 2
      end
    end

    describe '#memory' do
      it 'returns instance of Memory' do
        bench.send(:memory).must_be_instance_of Bruevich::Memory
      end
    end
  end
end
