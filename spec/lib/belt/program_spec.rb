# frozen_string_literal: true

require 'spec_helper'

module Belt
  RSpec.describe Program do
    let(:program) { described_class.new(lines: lines) }
    let(:lines) { ["halt\n"] }

    describe '#initialize' do
      it { expect(program.instance_variable_get('@lines')).to eql(lines) }
    end

    describe '#fetch' do
      subject(:fetch) { program.fetch(position) }
      let(:position) { 0 }

      it 'returns the instruction at the specified position' do
        expect(fetch).to eql(lines.first)
      end

      context 'when the position is out of range' do
        let(:position) { -3 }

        it 'raises an exception' do
          expect { fetch }.to raise_exception(Belt::OutOfRangeError)
        end
      end
    end

    describe '#size' do
      subject(:size) { program.size }

      it 'returns the size of the program' do
        expect(size).to eql(1)
      end
    end
  end
end
