# frozen_string_literal: true

module Belt
  Error = Class.new(StandardError)

  class FileEmptyError < Belt::Error
    def message
      "Nothing to do: '#{super}'"
    end
  end

  class FileNotFoundError < Belt::Error
    def message
      "File not found: '#{super}'"
    end
  end

  class Halt < Belt::Error
    def message
      'Halted.'
    end
  end

  class OutOfRangeError < Belt::Error
    def message
      'Out of range.'
    end
  end

  class UsageError < Belt::Error
    def message
      'Usage: belt [filename]'
    end
  end
end
