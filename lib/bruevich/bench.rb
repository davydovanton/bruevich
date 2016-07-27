class Bruevich
  class Bench
    ITERATIONS = [1, 10, 50, 100, 150]

    attr_reader :result
    attr_accessor :after_callback

    def initialize(iterations: nil)
      @iterations = iterations
      @result = {}
      @after_callback = -> {}
    end

    def bench(title = 'empty')
      result[:title] = title

      iterations.each do |count|
        initialize_result(count)

        GC.disable
        GC.start

        count.times do
          mem = memory.current_value
          yield
          result[count][:mem][:full] << memory.current_value - mem

          call_after_callback
        end

        GC.enable
        GC.start


        count.times do
          time = Time.now
          yield
          result[count][:time][:full] << Time.now - time

          call_after_callback
        end

      end

      calculate
    end

    def iterations
      @iterations || ITERATIONS
    end

    def iterations=(values)
      @iterations = Array(values)
    end

  private

    def call_after_callback
      after_callback.call
    end

    def initialize_result(count)
      result[count] = {}

      result[count][:time] = {}
      result[count][:time][:full] = []

      result[count][:mem] = {}
      result[count][:mem][:full] = []
    end

    def calculate
      iterations.each do |count, _|
        result[count][:time][:total] = result[count][:time][:full].inject(&:+)
        result[count][:mem][:total] = result[count][:mem][:full].inject(&:+)

        result[count][:time][:average] = result[count][:time][:total] / count
        result[count][:mem][:average] = result[count][:mem][:total] / count
      end
    end

    def memory
      @memory ||= Memory.new
    end
  end
end
