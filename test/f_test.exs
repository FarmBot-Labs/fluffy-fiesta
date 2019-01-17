defmodule FTest do
  use ExUnit.Case
  doctest F

  test "greets the world" do
    assert F.hello() == :world
  end
end
