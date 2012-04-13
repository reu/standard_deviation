require "spec_helper"

describe Array do
  describe "#stdev" do
    subject { values.stdev }

    context "with integer values" do
      let(:values) { [1, 2, 6, 3, -4, 23] }
      it { should == 9.32559202767667 }
    end

    context "with float values" do
      let(:values) { [1.0, 2.0, 6.0, 3.0, -4.0, 23.0] }
      it { should == 9.32559202767667 }
    end

    context "with bigdecimal values" do
      let(:values) { [BigDecimal("1.0"), BigDecimal("2.0"), BigDecimal("6.0"), BigDecimal("3.0"), BigDecimal("-4.0"), BigDecimal("23.0")] }
      it { should == 9.32559202767667 }
    end
  end
  
    describe "#stdevp" do
    subject { values.stdevp }

    context "with integer values" do
      let(:values) { [1, 2, 6, 3, -4, 23] }
      it { should == 8.51306185941476 }
    end

    context "with float values" do
      let(:values) { [1.0, 2.0, 6.0, 3.0, -4.0, 23.0] }
      it { should == 8.51306185941476 }
    end

    context "with bigdecimal values" do
      let(:values) { [BigDecimal("1.0"), BigDecimal("2.0"), BigDecimal("6.0"), BigDecimal("3.0"), BigDecimal("-4.0"), BigDecimal("23.0")] }
      it { should == 8.51306185941476 }
    end
  end
end
