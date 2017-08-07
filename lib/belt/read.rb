# frozen_string_literal: true

module Belt
  class Read # VM
    extend Forwardable

    def initialize(belt:)
      @belt = belt
    end

    def read
      loop { parse }
    rescue Belt::Halt
      raise Belt::Halt
    end

    private

    attr_reader :belt

    def_delegators :parser, :parse

    def parser
      Parser.new(raw: pc.read)
    end

    def pc
      @pc ||= ProgramCounter.new(address: 0, belt: belt)
    end
  end
end
