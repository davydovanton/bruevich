require "bruevich/version"
require "bruevich/bench"
require "bruevich/plotter"
require "bruevich/memory"

class Bruevich
  def initialize(iterations: nil, plotter: Plotter.new)
    @bench = Bench.new(iterations: iterations)
    @plotter = plotter
  end

  def bench(title = 'empty')
    @bench.bench(title) { yield }
  end

  def iterations=(values)
    @bench.iterations = Array(values)
  end

  def result
    @plotter.plot @bench.result, @bench.iterations
  end
end
