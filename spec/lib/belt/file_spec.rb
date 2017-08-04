# frozen_string_literal: true

require 'spec_helper'

module Belt
  RSpec.describe File do
    let(:file) { described_class.new(name) }
    let(:name) { './spec/support/file.bt' }

    describe '#process' do
      subject(:process) { file.process }

      xit 'returns the contents of the file as an array of lines' do
        expect(process).to eql(["halt\n"])
      end
    end
  end
end
