require "bruevich/version"
require "bruevich/bench"
require "bruevich/plotter"
require "bruevich/memory"

class Bruevich
  def initialize(iterations: nil, plotter: Plotter.new, disable_memory: false)
    @bench = Bench.new(iterations: iterations, disable_memory: disable_memory)
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

  def after(&block)
    @bench.after_callback = block
  end
end
