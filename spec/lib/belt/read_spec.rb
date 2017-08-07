# frozen_string_literal: true

require 'spec_helper'

module Belt
  RSpec.describe Read do
    let(:read) { described_class.new(belt: belt) }

    describe '#initialize' do
    end

    describe '#read' do
      subject { read.read }

      let(:belt) { ["halt\n"] }

      it 'raises an exception when encountering "halt"' do
        expect { subject }.to raise_exception(Belt::Halt)
      end
    end
  end
end
