# frozen_string_literal: true

require 'spec_helper'

module Belt
  RSpec.describe Parser do
    let(:parser) { described_class.new(raw: raw, bc: bc) }
    let(:raw) { Belt::ProgramCounter.new(address: 0, program: "noop\n") }
    let(:bc) { Belt::ByteCounter.new(value: 0) }

    describe '#initialize' do
      it { expect(parser.instance_variable_get('@raw')).to eql(raw) }
      it { expect(parser.instance_variable_get('@bc')).to eql(bc) }
    end

    describe '#parse' do
      subject(:parse) { parser.parse }

      context 'when "halt"' do
        xit
      end

      context 'when "beep"' do
        xit
      end

      context 'when "noop"' do
        xit
      end

      context 'when the instruction cannot be parsed' do
        xit
      end
    end
  end
end
