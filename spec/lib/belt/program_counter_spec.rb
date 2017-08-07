# frozen_string_literal: true

require 'spec_helper'

module Belt
  RSpec.describe ProgramCounter do
    let(:program_counter) { described_class.new(address: address, belt: belt) }
    let(:address) { 3 }
    let(:belt) { %w[noop\n noop\n noop\n noop\n noop\n] }

    describe '#initialize' do
      subject { program_counter }

      it { expect(subject.instance_variable_get('@address')).to eql(address) }
      it { expect(subject.instance_variable_get('@belt')).to eql(belt) }
    end

    describe '#address' do
      subject { program_counter.address }

      it { expect(subject).to eql(address) }
    end

    describe '#read' do
      subject { program_counter.read }
    end
  end
end
