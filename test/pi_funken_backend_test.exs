defmodule PiFunkenRouterTest do
  use ExUnit.Case
  doctest PiFunkenRouter

  test "greets the world" do
    assert PiFunkenRouter.hello() == :world
  end
end
