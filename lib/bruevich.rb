require "bruevich/version"

class Bruevich
  ITERATIONS = [1, 10, 50, 100, 150]

  attr_reader :result

  def initialize
    @result = {}
  end

  def bench
    ITERATIONS.each do |count|
      result[count] = {}
      result[count][:time] = {}
      result[count][:time][:per_iteration] = []

      result[count][:mem] = {}
      result[count][:mem][:per_iteration] = []

      GC.disable
      GC.start
      mem_start = memory
      time_start = Time.now

      count.times do
        yield
      end

      result[count][:time][:total] = Time.now - time_start
      result[count][:mem][:total] = memory - mem_start
      GC.enable
    end

    calculate
  end

private

  def calculate
    result.each do |count, _|
      result[count][:time][:average] = result[count][:time][:total] / count
      result[count][:mem][:average] = result[count][:mem][:total] / count
    end
  end

  def memory
    `ps ax -o pid,rss | grep -E "^[[:space:]]*#{$$}"`.strip.split.map(&:to_i).last
  end
end
