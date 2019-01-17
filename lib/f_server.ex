defmodule F.Server do
  @token 0xFBFB
  @header_byte_size 10

  def run do
    uuid = UUID.uuid4()
    req_pipe_name = "#{uuid}-request.fb"
    resp_pipe_name = "#{uuid}-response.fb"
    {_, 0} = System.cmd("mkfifo", [req_pipe_name])
    {_, 0} = System.cmd("mkfifo", [resp_pipe_name])
    {:ok, req_pipe} = :file.open(to_charlist(req_pipe_name), [:read, :write, :binary, :raw])
    {:ok, resp_pipe} = :file.open(to_charlist(resp_pipe_name), [:read, :write, :binary, :raw])
    state = %{request_pipe: req_pipe, response_pipe: resp_pipe}
    loop(state)
  end

  def loop(state) do
    {:ok, <<@token::size(16), _reserved::size(32), payload_size::integer-big-size(32)>>} =
      :file.read(state.request_pipe, @header_byte_size)

    {:ok, request_payload} = :file.read(state.request_pipe, payload_size)
    response_payload = F.add_header(String.reverse(request_payload))
    :file.write(state.response_pipe, response_payload)
    loop(state)
  end
end
