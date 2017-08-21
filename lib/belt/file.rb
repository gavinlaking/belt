# frozen_string_literal: true

module Belt
  class File
    extend Forwardable

    def initialize(name)
      @name = name.to_s
    end

    def process
      name? { exists? { contents? { read } } }
    end

    private

    attr_reader :name

    def_delegators :vm, :read

    def vm
      VM.new(program: program)
    end

    def program
      Belt::Program.new(lines: lines)
    end

    def lines
      ::File.readlines(name)
    end

    def name?
      yield unless name.empty?

      raise Belt::UsageError, name
    end

    def exists?
      yield if ::File.exist?(name)

      raise Belt::FileNotFoundError, name
    end

    def contents?
      yield if ::File.size?(name)

      raise Belt::FileEmptyError, name
    end
  end
end
