# frozen_string_literal: true

module Belt
  class Parser
    def initialize(raw:, bc:)
      @raw = raw
      @bc = bc
    end

    def parse
      if matches?(/^halt/)
        raise Belt::Halt
      elsif matches?(/^beep/)
        puts 'beep'
      elsif matches?(/^noop/)
        puts 'noop'
      elsif matches?(/^incr/)
        bc.increment
      elsif matches?(/^decr/)
        bc.decrement
      elsif matches?(/^jump/)

      else
        puts '----'
      end
    end

    private

    attr_reader :raw, :bc

    def matches?(reg_exp)
      raw.match?(reg_exp)
    end

    def data
      raw.chomp
    end
  end
end
