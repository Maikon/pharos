defmodule DemoGenServerTest do
  use ExUnit.Case
  doctest DemoGenServer

  setup do
    on_exit fn ->
      GenServer.stop(DemoGenServer)
      DemoGenServer.start_link
    end
  end

  test "initial state is empty" do
    assert DemoGenServer.all() == []
  end

  test "returns single element stored" do
    DemoGenServer.store("hello")
    assert DemoGenServer.all() == ["hello"]
  end

  test "returns multiple elements stored" do
    DemoGenServer.store("hello")
    DemoGenServer.store("world")
    DemoGenServer.store("!")
    assert DemoGenServer.all() == ["hello", "world", "!"]
  end
end
