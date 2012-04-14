require "standard_deviation"
require "benchmark"
require 'bigdecimal'

class Array
  def stdev_ruby
    total = inject :+
    mean  = total.to_f / size
    variance = inject(0) { |variance, value| variance + (value - mean) ** 2 } / (size - 1)

    Math.sqrt(variance)
  end
end

n = 50
values = (1..10_000).map { |value| BigDecimal.new [value, (rand * 10000000000).to_i].join(".") }

Benchmark.bm do |b|
  b.report do
    n.times { values.stdev }
  end

  b.report do
    n.times { values.stdev_ruby }
  end
end
