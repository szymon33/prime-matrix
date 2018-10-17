require 'multiplication'

describe Multiplication do
  describe '.build_matrix' do
    subject do
      multiplication = described_class.new(num)
      multiplication.instance_variable_set('@table_size', num)
      multiplication.send(:build_matrix)
    end

    context 'example size 1' do
      let(:num) { 1 }

      it {
        is_expected.to eq [[nil, 2],
                           [2,   4]]
      }
    end

    context 'example size 2' do
      let(:num) { 2 }

      it {
        is_expected.to eq [[nil, 2, 3],
                           [2,   4, 6],
                           [3,   6, 9]]
      }
    end

    context 'example size 3' do
      let(:num) { 3 }

      it {
        is_expected.to eq [[nil, 2,  3,  5],
                           [2,   4,  6, 10],
                           [3,   6,  9, 15],
                           [5,  10, 15, 25]]
      }
    end
  end

  describe '.vector' do
    subject do
      multiplication = described_class.new(num)
      multiplication.instance_variable_set('@table_size', num)
      multiplication.send(:vector)
    end

    context 'with one prime number' do
      let(:num) { 1 }

      it { is_expected.to eq [2] }
    end

    context 'with two prime numbers' do
      let(:num) { 2 }

      it { is_expected.to eq [2, 3] }
    end

    context 'with 5 prime numbers' do
      let(:num) { 5 }

      it { is_expected.to eq [2, 3, 5, 7, 11] }
    end
  end

  describe '.valid?' do
    subject do
      multiplication = described_class.new(num)
      multiplication.instance_variable_set('@table_size', num)
      multiplication.send(:valid?)
    end

    context 'is true when table_size is a number' do
      let(:num) { 5 }

      it { is_expected.to be_truthy }
    end

    context 'is false when table_size is nil' do
      let(:num) { nil }

      it { is_expected.to be_falsey }
    end

    context 'is false when table_sie is not a number' do
      let(:num) { 'La La Land' }

      it { is_expected.to be_falsey }
    end
  end

  describe '.prime?' do
    subject { described_class.new(10).send(:prime?, num) }

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
      let(:num) { 10_000 }

      it { is_expected.to be_falsey }
    end
  end
end
