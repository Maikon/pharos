defmodule PharosWeb.SearchController do
  use PharosWeb.Web, :controller

  def index(conn, _params) do
    results = Twitter.MemoryDb.all()
    Application.get_env(:pharos_web, :parent_node)
    |> Node.start

    Application.get_env(:pharos_web, :wiki_node)
    |> Node.connect

    render conn, "index.html", results: results
  end

  def search(conn, %{"topic" => topic, "amount" => amount}) do
    query = %{topic: topic, amount: String.to_integer(amount)}

    results = [{Wikipedia.Search, Application.get_env(:pharos_web, :wiki_node)}]
      |> Enum.map(fn({mod, node}) -> :rpc.call(node, mod, :for_topic, [query])
    end)

    result = case results do
               [{:badrpc, _}] -> []
               [] -> []
               [response] -> response
            end

    MemoryDb.store(topic, result)

    redirect conn, to: search_path(conn, :index)
  end
end
