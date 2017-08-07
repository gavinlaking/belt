# frozen_string_literal: true

module Belt
  class ProgramCounter
    extend Forwardable

    attr_reader :address

    def initialize(address:, belt:)
      @address = address
      @belt = belt
    end

    def read
      fetch { increment }
    end

    private

    attr_reader :belt
    def_delegators :belt, :size

    def fetch
      position.tap { yield }
    end

    def increment
      if address >= size
        @address = 0
      else
        @address += 1
      end
    end

    def position
      belt[address]
    end
  end
end
