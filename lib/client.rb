module CSVM
  class Client
    attr_reader :pid, :transport

    def initialize(pid = Process.pid)
      @pid = pid
    end
  end
end
