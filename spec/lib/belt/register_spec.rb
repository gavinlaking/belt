# frozen_string_literal: true

require 'spec_helper'

module Belt
  RSpec.describe Register do
    let(:register) { described_class.new(value) }
    let(:value) { 42 }

    describe '#initialize' do
      it { expect(register.instance_variable_get('@value')).to eql(value) }
    end

    describe '#value' do
      subject { register.value }

      it 'returns the value' do
        expect(subject).to eql(value)
      end
    end
  end
end
