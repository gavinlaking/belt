# frozen_string_literal: true

require 'spec_helper'

module Belt
  RSpec.describe Read do
    describe '#read' do
      subject(:read) { described_class.new(belt).read }

      let(:belt) { ["halt\n"] }

      it 'raises an exception when encountering "halt"' do
        expect { read }.to raise_exception(Belt::Halt)
      end
    end
  end
end
