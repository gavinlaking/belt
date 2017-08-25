# frozen_string_literal: true

require 'spec_helper'

module Belt
  RSpec.describe File do
    let(:file) { described_class.new(name) }
    let(:name) { './spec/support/file.bt' }

    describe '#initialize' do
      it { expect(file.instance_variable_get('@name')).to eql(name) }
    end

    describe '#process' do
      subject(:process) { file.process }

      context 'when the file contains processable code' do
        it 'interprets and executes the instructions' do
          expect { process }.to raise_exception(Belt::Halt)
        end
      end

      context 'when the filename is not given' do
        let(:name) { '' }

        it { expect { process }.to raise_exception(Belt::UsageError) }
      end

      context 'when the file does not exist' do
        let(:name) { './spec/support/missing.bt' }

        it { expect { process }.to raise_exception(Belt::FileNotFoundError) }
      end

      context 'when the file is empty' do
        let(:name) { './spec/support/empty.bt' }

        it { expect { process }.to raise_exception(Belt::FileEmptyError) }
      end
    end
  end
end
