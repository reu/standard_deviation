require "standard_deviation"
require "bigdecimal"

RSpec::Matchers.define :be_close_to do |expected|
  match do |actual|
    BigDecimal.new(actual.to_s).round(10) == BigDecimal.new(expected.to_s).round(10)
  end
end
