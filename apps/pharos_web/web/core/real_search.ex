defmodule Core.RealSearch do

  def execute(%{"topic" => topic, "amount" => amount}) do
    query = %{topic: topic, amount: String.to_integer(amount)}

    results = Enum.map(
      [Wikipedia.Search, Twitter.Search],
      fn(search_service) -> search_service.for_topic(query) end
    )
    |> List.flatten

    MemoryDb.store(topic, results)
  end
end
