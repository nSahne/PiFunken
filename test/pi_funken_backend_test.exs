defmodule PiFunkenBackendTest do
  use ExUnit.Case
  doctest PiFunkenBackend

  test "greets the world" do
    assert PiFunkenBackend.hello() == :world
  end
end
