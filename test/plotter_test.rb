require 'test_helper'

describe Bruevich::Plotter do
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

  describe '#plot' do
    it 'returns kb of current memory used' do
      out, _ = capture_io do
        Bruevich::Plotter.new.plot(result, iterations)
      end

      out.must_match /Results for test bench/

      out.must_match /1:/
      out.must_match /\tavarage time - 0.2/
      out.must_match /\tavarage memory - 2/

      out.must_match /10:/
      out.must_match /\tavarage time - 2.0/
      out.must_match /\tavarage memory - 20/
    end
  end
end
