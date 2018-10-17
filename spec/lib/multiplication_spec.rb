require 'multiplication'

describe Multiplication do
  describe '.prime?' do
    subject { described_class.new.send(:prime?, num) }

    context 'for number less or equal to 1' do
      let(:num) { 1 }

      it { is_expected.to be_falsey }
    end

    context 'for small prime number like 5' do
      let(:num) { 5 }

      it { is_expected.to be_truthy }
    end

    context 'for bigger prime number like 521' do
      let(:num) { 521 }

      it { is_expected.to be_truthy }
    end

    context 'for small, not prime number like 6' do
      let(:num) { 6 }

      it { is_expected.to be_falsey }
    end

    context 'for bigger, not prime number like 10000' do
      let(:num) { 10000 }

      it { is_expected.to be_falsey }
    end
  end
end
