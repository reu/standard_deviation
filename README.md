# Native Standard Deviation

An implementation of the standard deviation calculation in C, with much better performance (50x-100x) than using pure ruby.

## Installation

Add this line to your application's Gemfile:

    gem 'standard_deviation'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install standard_deviation

## Usage

Just call `standard_deviation` or `stdev` on an array with numbers:

``` ruby
[1, 2, 3, 4, 5].stdev => 1.5811388300841898

[521.0, BigDecimal("1234.45"), 1_120].standard_deviation => 383.168958598336
```
For population standard deviation, call `stdevp`:

``` ruby
[1, 2, 3, 4, 5].stdevp => 1.4142135623731
```

## Benchmarks

``` ruby
# Basic ruby implementation
class Array
  def stdev_ruby
    total = inject :+
    mean  = total.to_f / size
    variance = inject(0) { |variance, value| variance + (value - mean) ** 2 }

    Math.sqrt(variance / (size - 1))
  end
end

# Running on a 2.4 GHz MacBook Pro
n = 10000
values = (1..10_000).map(&:to_f)

Benchmark.bm do |b|
  b.report do
    n.times { values.stdev }
  end

  b.report do
    n.times { values.stdev_ruby }
  end
end

#       user     system      total        real
#   1.070000   0.000000   1.070000 (  1.065246)
#  88.180000   0.550000  88.730000 ( 93.835144)
```
