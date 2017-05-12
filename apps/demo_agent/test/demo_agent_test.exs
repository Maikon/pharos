defmodule DemoAgentTest do
  use ExUnit.Case

  setup do
    on_exit fn ->
      Agent.stop(DemoAgent)
      DemoAgent.start_link
    end
  end

  test "returns initial state" do
    assert DemoAgent.all == []
  end

  test "returns an item" do
    DemoAgent.store("hello")
    assert DemoAgent.all == ["hello"]
  end
end
