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
      it { should == 8.513061859414755 }
    end

    context "with float values" do
      let(:values) { [1.0, 2.0, 6.0, 3.0, -4.0, 23.0] }
      it { should == 8.513061859414755 }
    end

    context "with bigdecimal values" do
      let(:values) { [BigDecimal("1.0"), BigDecimal("2.0"), BigDecimal("6.0"), BigDecimal("3.0"), BigDecimal("-4.0"), BigDecimal("23.0")] }
      it { should == 8.513061859414755 }
    end
  end

  describe "#sample_variance" do
    subject { values.sample_variance }

    context "with integer values" do
      let(:values) { [1, 2, 6, 3, -4, 23] }
      it { should == 86.96666666666665 }
    end

    context "with float values" do
      let(:values) { [1.0, 2.0, 6.0, 3.0, -4.0, 23.0] }
      it { should == 86.96666666666665 }
    end

    context "with bigdecimal values" do
      let(:values) { [BigDecimal("1.0"), BigDecimal("2.0"), BigDecimal("6.0"), BigDecimal("3.0"), BigDecimal("-4.0"), BigDecimal("23.0")] }
      it { should == 86.96666666666665 }
    end
  end

  describe "#population_variance" do
    subject { values.population_variance }

    context "with integer values" do
      let(:values) { [1, 2, 6, 3, -4, 23] }
      it { should == 72.47222222222221 }
    end

    context "with float values" do
      let(:values) { [1.0, 2.0, 6.0, 3.0, -4.0, 23.0] }
      it { should == 72.47222222222221 }
    end

    context "with bigdecimal values" do
      let(:values) { [BigDecimal("1.0"), BigDecimal("2.0"), BigDecimal("6.0"), BigDecimal("3.0"), BigDecimal("-4.0"), BigDecimal("23.0")] }
      it { should == 72.47222222222221 }
    end
  end
end
