defmodule F.Client do
  @token 0xFBFB
  @header_byte_size 10

  def run(request_pipe_name, response_pipe_name, data) do
    {:ok, req_pipe} = :file.open(to_charlist(request_pipe_name), [:read, :write, :binary, :raw])
    {:ok, resp_pipe} = :file.open(to_charlist(response_pipe_name), [:read, :write, :binary, :raw])

    :ok = :file.write(req_pipe, F.add_header(data))

    {:ok, <<@token::size(16), _reserved::size(32), payload_size::integer-big-size(32)>>} =
      :file.read(resp_pipe, @header_byte_size)

    {:ok, returned_data} = :file.read(resp_pipe, payload_size)
    :ok = :file.close(req_pipe)
    :ok = :file.close(resp_pipe)
    returned_data
  end
end
