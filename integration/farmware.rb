def add_header(payload)
  size = payload.bytesize
  header = [0xFBFB, 0, size].pack("sii>")
  header + payload
end

req_pipe = File.open("/home/connor/farmbot/f/66668a00-92be-4a23-b573-3f7587f8abfd-request.fb", "wb")
resp_pipe = File.open("/home/connor/farmbot/f/66668a00-92be-4a23-b573-3f7587f8abfd-response.fb", "rb")
payload = add_header("hello world")
req_pipe.write(payload)
header = resp_pipe.read(10)
puts(header.inspect())