require "standard_deviation"
require "benchmark"

class Array
  def stdev_ruby
    total = inject :+
    mean  = total.to_f / size
    variance = inject(0) { |variance, value| variance + (value - mean) ** 2 } / (size - 1)

    Math.sqrt(variance)
  end
end

n = 1000
values = (1..10_000).map(&:to_f)

Benchmark.bm do |b|
  b.report do
    n.times { values.stdev }
  end

  b.report do
    n.times { values.stdev_ruby }
  end
end
