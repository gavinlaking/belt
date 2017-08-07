# frozen_string_literal: true

module Belt
  class Parser
    def initialize(raw:)
      @raw = raw
    end

    def parse
      if matches?(/^halt/)
        raise Belt::Halt
      elsif matches?(/^beep/)
        puts 'beep'
      elsif matches?(/^noop/)
        puts 'noop'
      else
        puts '----'
      end
    end

    private

    attr_reader :raw

    def matches?(reg_exp)
      raw.match?(reg_exp)
    end

    def data
      raw.chomp
    end
  end
end
