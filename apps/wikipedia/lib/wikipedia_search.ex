defmodule Wikipedia.Search do

  @doc """
  Wikipedia.Search takes a topic and searches for a specific number of results using the Wikipedia API.

  ## Examples
    iex> Wikipedia.Search.for_topic(%{topic: "pizza", amount: 1"})
    [%Wikipedia.Result{description: "Pizza is a yeasted flatbread typically topped with tomato sauce and cheese and baked in an oven. It is commonly topped with a selection of meats, vegetables and condiments.",
     link: "https://en.wikipedia.org/wiki/Pizza",
     ource: 'wikipedia', title: "Pizza"}]
  """
  @spec for_topic(%{topic: String.T, amount: Integer}) :: [Wikipedia.Result]
  def for_topic(%{topic: topic, amount: amount}) do
    Wikipedia.WikiClient.search_for(topic, amount)
  end
end
