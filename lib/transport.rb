require_relative "./constants"

module CSVM
  class Transport
    Const = Constants

    attr_reader :pid

    def initialize
      @pid = Process.pid
    end

    def push_data(payload)
      data_.puts(payload)
    end

    def push_blob(payload)
      blob_.puts(payload)
    end

    def pull_data()
    end

    def pull_blob()
    end

    private

    def pipe(template)
      File.open(template % { pid: pid })
    end

    def blob_reader
      @data_reader ||= pipe(Const::BLOB_INPUT_TPL)
    end

    def blob_writer
      @data_writer ||= pipe(Const::BLOB_OUTPUT_TPL)
    end

    def data_reader
      @blob_reader ||= pipe(Const::DATA_INPUT_TPL)
    end

    def data_writer
      @blob_writer ||= pipe(Const::DATA_OUTPUT_TPL)
    end
  end
end
