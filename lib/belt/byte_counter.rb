# frozen_string_literal: true

module Belt
  class ByteCounter < Register
    def initialize(value:)
      @value = value
    end

    def decrement
      (@value -= 1).tap { output }
    end

    def increment
      (@value += 1).tap { output }
    end

    def reset
      (@value = 0).tap { output }
    end

    private

    def output
      puts @value
    end
  end
end
