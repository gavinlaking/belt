# frozen_string_literal: true

module Belt
  class ProgramCounter
    extend Forwardable

    attr_reader :address

    def initialize(address:, program:)
      @address = address
      @program = program
    end

    def read
      fetch { increment }
    end

    private

    attr_reader :program

    def_delegators :program, :size

    def fetch
      program.fetch(address).tap { yield }
    end

    def increment
      if address >= size
        @address = 0
      else
        @address += 1
      end
    end
  end
end
