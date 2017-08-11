# frozen_string_literal: true

require 'spec_helper'

module Belt
  RSpec.describe ByteCounter do
    let(:byte_counter) { described_class.new(value: value) }
    let(:value) { 0 }

    describe '#initialize' do
      subject { byte_counter }

      it { expect(subject.instance_variable_get('@value')).to eql(value) }
    end

    describe '#value' do
      subject { byte_counter.value }

      it 'returns the value' do
        expect(subject).to eql(0)
      end
    end

    describe '#decrement' do
      subject(:decrement) { byte_counter.decrement }

      let(:value) { 3 }

      it 'returns the decremented counter' do
        expect(decrement).to eql(2)
      end
    end

    describe '#increment' do
      subject(:increment) { byte_counter.increment }

      let(:value) { 2 }

      it 'returns the decremented counter' do
        expect(increment).to eql(3)
      end
    end

    describe '#reset' do
      subject(:reset) { byte_counter.reset }

      it 'returns the counter reset to 0' do
        expect(reset).to eql(0)
      end
    end
  end
end
