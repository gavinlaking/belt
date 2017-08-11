# frozen_string_literal: true

module Belt
  class File
    def initialize(name)
      @name = name.to_s
    end

    def process
      name? { exists? { contents? { read } } }
    end

    private

    attr_reader :name

    def read
      Read.new(program: program).read
    rescue Belt::Halt
      raise Belt::Error, message
    end

    def program
      Belt::Program.new(lines: lines)
    end

    def lines
      ::File.readlines(name)
    rescue Errno::ENOENT
      raise Belt::Error, 'Usage: belt [filename]'
    end

    def name?
      raise Belt::UsageError, name if name.empty?

      yield
    end

    def exists?
      raise Belt::FileNotFoundError, name unless ::File.exist?(name)

      yield
    end

    def contents?
      raise Belt::FileEmptyError, name unless ::File.size?(name)

      yield
    end

    def message
      "\e[31mHalted: '#{name}'\e[39m"
    end
  end
end
