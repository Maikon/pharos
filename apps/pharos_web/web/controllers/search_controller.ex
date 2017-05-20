defmodule PharosWeb.SearchController do
  use PharosWeb.Web, :controller

  def index(conn, _params) do
    results = MemoryDb.all()
    render conn, "index.html", results: results
  end

  def search(conn, query) do
    query_params = %{topic: query["topic"], amount: String.to_integer(query["amount"])}

    all_results =
      Enum.map(
               [Wikipedia.Search, Twitter.Search],
               fn(search_service) -> search_service.for_topic(query_params) end
             )

      results = List.flatten(all_results)
      MemoryDb.store(query_params[:topic], results)
      redirect conn, to: search_path(conn, :index)
  end
end
