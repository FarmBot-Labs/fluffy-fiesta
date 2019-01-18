# F

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `f` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:f, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/f](https://hexdocs.pm/f).


## RPC SPEC

| Paramater name | size/format    | Description                          |
|:--------------:|:--------------:|:------------------------------------:|
| Magic token    | 2 bytes        | always `0xFBFB`                      |
| RESERVED       | 4 bytes signed | always 4 bytes of 0x00               |
| Payload size   | 4 bytes signed | big endian integer                   |
| Payload        | `size` bytes   | any ole data of exactly `size` bytes |

62694012-0159-4faf-bbfa-47107aab9bc9-request.fb
62694012-0159-4faf-bbfa-47107aab9bc9-response.fb
