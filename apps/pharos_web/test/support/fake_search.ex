defmodule FakeSearch do

  def execute(%{"topic" => topic}) do
    MemoryDb.store(topic, [])
  end
end
