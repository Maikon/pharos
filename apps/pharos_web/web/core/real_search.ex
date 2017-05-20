defmodule Core.RealSearch do
  def execute(%{"topic" => topic, "amount" => amount}) do

    query_params = %{topic: topic, amount: String.to_integer(amount)}

    all_results =
      Enum.map(
               [Wikipedia.Search, Twitter.Search],
               fn(search_service) -> search_service.for_topic(query_params) end
             )

      results = List.flatten(all_results)
      MemoryDb.store(query_params[:topic], results)
  end
end
