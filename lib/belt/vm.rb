# frozen_string_literal: true

module Belt
  class VM
    extend Forwardable

    def initialize(program:)
      @program = program
    end

    def read
      loop { parse }
    end

    private

    attr_reader :program

    def_delegators :parser, :parse

    def parser
      Parser.new(raw: pc.read, bc: bc)
    end

    def pc
      @pc ||= ProgramCounter.new(address: 0, program: program)
    end

    def bc
      @bc ||= ByteCounter.new(value: 0)
    end
  end
end
