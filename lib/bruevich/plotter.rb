class Bruevich
  class Plotter
    def plot(result, iterations)
      puts "Results for #{result[:title]}"
      iterations.each do |i|
        puts "#{i}: "
        puts "\tavarage time - #{result[i][:time][:average]}"
        puts "\tavarage memory - #{result[i][:mem][:average]}"
      end
    end
  end
end
