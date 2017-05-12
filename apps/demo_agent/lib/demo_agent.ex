defmodule DemoAgent do

  def start_link do
    state = []
    Agent.start_link(fn -> state end, name: __MODULE__)
  end

  def store(item) do
    Agent.update(__MODULE__, fn(state) -> state ++ [item] end)
  end

  def all do
    Agent.get(__MODULE__, fn(state) -> state end)
  end
end
