# frozen_string_literal: true

require 'spec_helper'

module Belt
  RSpec.describe Parser do
    let(:parser) { described_class.new(raw: raw) }
    let(:raw) { "noop\n" }

    describe '#initialize' do
      it { expect(parser.instance_variable_get('@raw')).to eql(raw) }
    end

    describe '#parse' do
      subject(:parse) { parser.parse }
    end
  end
end
