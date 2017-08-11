# frozen_string_literal: true

require 'spec_helper'

module Belt
  RSpec.describe Read do
    let(:read) { described_class.new(program: program) }
    let(:program) { ["halt\n"] }

    describe '#initialize' do
      it { expect(read.instance_variable_get('@program')).to eql(program) }
    end

    describe '#read' do
      subject { read.read }

      it 'raises an exception when encountering "halt"' do
        expect { subject }.to raise_exception(Belt::Halt)
      end
    end
  end
end
