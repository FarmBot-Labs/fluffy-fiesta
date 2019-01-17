defmodule F do
  @token 0xFBFB
  def add_header(payload) do
    <<@token::size(16)>> <>
      :binary.copy(<<0x00>>, 4) <> <<byte_size(payload)::big-size(32)>> <> payload
  end
end
