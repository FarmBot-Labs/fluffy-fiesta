module CSVM
  module Constants
    PREFIX          = "farmware_pipe_"

    BLOB_INPUT_TPL  = PREFIX + "blob_input_%{pid}"
    BLOB_OUTPUT_TPL = PREFIX + "blob_output_%{pid}"
    DATA_INPUT_TPL  = PREFIX + "input_%{pid}"
    DATA_OUTPUT_TPL = PREFIX + "output_%{pid}"
  end
end
