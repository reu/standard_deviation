require "spec_helper"

describe Array do
  shared_examples_for "a serie calculation" do
    context "when called on a empty array" do
      let(:values) { [] }
      it { -> { subject }.should raise_exception ZeroDivisionError, "not enough elements" }
    end

    context "when called on a array with only one element" do
      let(:values) { [1] }
      it { -> { subject }.should raise_exception ZeroDivisionError, "not enough elements" }
    end
  end

  describe "#stdev" do
    subject { values.stdev }

    it_should_behave_like "a serie calculation"

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

    it_should_behave_like "a serie calculation"

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

    it_should_behave_like "a serie calculation"

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

    it_should_behave_like "a serie calculation"

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
