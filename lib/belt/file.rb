# frozen_string_literal: true

module Belt
  class File
    def initialize(name)
      @name = name.to_s
    end

    def process
      name? { exists? { contents? { Read.new(lines).read } } }
    rescue Belt::Halt
      raise Belt::Error, "\e[31mHalted: '#{name}'\e[39m"
    end

    private

    attr_reader :name

    def lines
      ::File.readlines(name)
    rescue Errno::ENOENT
      raise Belt::Error, 'Usage: belt [filename]'
    end

    def name?(&_block)
      if name.empty?
        raise Belt::UsageError, name
      else
        yield
      end
    end

    def exists?(&_block)
      if ::File.exists?(name)
        yield
      else
        raise Belt::FileNotFoundError, name
      end
    end

    def contents?(&_block)
      if ::File.size?(name)
        yield
      else
        raise Belt::FileEmptyError, name
      end
    end
  end
end
