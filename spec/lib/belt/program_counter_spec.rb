# frozen_string_literal: true

require 'spec_helper'

module Belt
  RSpec.describe ProgramCounter do
    let(:program_counter) do
      described_class.new(address: address, program: program)
    end
    let(:address) { 3 }
    let(:program) { %w[noop\n noop\n noop\n noop\n noop\n] }

    describe '#initialize' do
      subject { program_counter }

      it { expect(subject.instance_variable_get('@address')).to eql(address) }
      it { expect(subject.instance_variable_get('@program')).to eql(program) }
    end

    describe '#address' do
      subject { program_counter.address }

      it { expect(subject).to eql(address) }
    end

    describe '#read' do
      subject { program_counter.read }

      xit 'reads the program at the current position'

      it 'move the program forward ready for the next instruction' do
        subject
        expect(program_counter.address).to eql(4)
      end
    end
  end
end
