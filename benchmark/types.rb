require "standard_deviation"
require "bigdecimal"
require "benchmark"

n = 100
range =  (1..10_000)

integers = range.to_a
floats   = range.map(&:to_f)
decimals = range.map { |value| BigDecimal.new [value, (rand * 10000000000).to_i].join(".") }

Benchmark.bm do |b|
  b.report do
    n.times { integers.stdev }
  end

  b.report do
    n.times { floats.stdev }
  end

  b.report do
    n.times { decimals.stdev }
  end
end
