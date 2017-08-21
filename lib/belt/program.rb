# frozen_string_literal: true

module Belt
  class Program
    def initialize(lines:)
      @lines = lines
    end

    def fetch(position)
      raise Belt::OutOfRangeError if out_of_range?(position)

      lines.at(position)
    end

    def size
      lines.size
    end

    private

    attr_reader :lines

    def out_of_range?(position)
      position.negative? || position > size - 1
    end
  end
end
