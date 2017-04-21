defmodule PharosWeb.SearchController do
  use PharosWeb.Web, :controller

  def index(conn, _params) do
    results = Twitter.MemoryDb.all()

    render conn, "index.html", results: results
  end

  def search(conn, query) do
    results = Twitter.Search.execute(query)

    Twitter.MemoryDb.store(query["topic"], results)
    redirect conn, to: search_path(conn, :index)
  end
end
