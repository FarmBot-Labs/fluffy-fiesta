defmodule F do
  @token 0xFBFB
  def add_header(payload) do
    header = <<@token::size(16)>> <>
      :binary.copy(<<0x00>>, 4) <> <<byte_size(payload)::big-size(32)>>
    IO.puts "header size: #{byte_size(header)}"
    IO.inspect(header, label: "Header", base: :hex)
    header <> payload
  end
end
