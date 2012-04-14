require "standard_deviation"
require "bigdecimal"

RSpec::Matchers.define :be_close_to do |expected|
  match do |actual|
    actual.round(10) == expected.round(10)
  end
end
