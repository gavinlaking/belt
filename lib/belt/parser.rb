module Belt
  class Parser
    def initialize(raw)
      @raw = raw
    end

    def parse
      if raw =~ /^halt/
        raise Belt::Halt
      elsif raw =~ /^beep/
        puts "beep"
      elsif raw =~ /^noop/
        sleep 1
        puts "noop"
      else
        puts "----"
      end
    end

    private

    attr_reader :raw

    def data
      raw.chomp
    end
  end
end
