# frozen_string_literal: true

module Belt
  class Read # VM
    extend Forwardable

    def initialize(program:)
      @program = program
    end

    def read
      loop { parse }
    rescue Belt::Halt
      raise Belt::Halt
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
