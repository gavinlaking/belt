module Belt
  class Read # VM
    def initialize(belt)
      @belt = belt
    end

    def read
      loop do
        Parser.new(pc.read).parse
      end
    rescue Belt::Halt
      raise Belt::Halt
    end

    private

    attr_reader :belt

    def pc
      @pc ||= ProgramCounter.new(address: 0, belt: belt)
    end

    class ProgramCounter
      extend Forwardable

      def initialize(address:, belt:)
        @address = address
        @belt = belt
      end

      def read
        fetch { increment }
      end

      private

      attr_reader :address, :belt
      def_delegators :belt, :size

      def fetch(&block)
        belt[address].tap { yield }
      end

      def increment
        if address >= size
          @address = 0
        else
          @address += 1
        end
      end
    end
  end
end
