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
      Parser.new(raw: pc.read)
    end

    def pc
      @pc ||= ProgramCounter.new(address: 0, program: program)
    end
  end
end
