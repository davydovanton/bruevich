class Bruevich
  class Memory
    # returns current memory value in kb
    def current_value
      `ps -o rss -p #{$$}`.strip.split.last.to_i
    end
  end
end
