import os
import errno
import sys
import array
import struct

def add_header(payload):
  b = bytes("hello world", "utf-8")
  size = len(b)
  token = 0xFBFB
  header = struct.pack('!Hii', token, 0, size)
  return header + b


# print("Opening FIFO...")
req_pipe = open("f6c3c230-8d59-42e2-be90-d8141b19381e-request.fb", "wb")
resp_pipe = open("f6c3c230-8d59-42e2-be90-d8141b19381e-response.fb", "rb")
payload = "hello world"
full = add_header(payload)
req_pipe.write(full)

header = resp_pipe.read(10)
(token, unused, size) = struct.unpack('!Hii', header)
print(token)
print(unused)
print(size)
payload = resp_pipe.read(size)
print(payload)