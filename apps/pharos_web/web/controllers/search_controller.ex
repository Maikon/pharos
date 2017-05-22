defmodule PharosWeb.SearchController do
  use PharosWeb.Web, :controller

  def index(conn, _params) do
    results = MemoryDb.all()
    render conn, "index.html", results: results
  end

  def search(conn, query) do
    Core.RealSearch.execute(query)

    redirect conn, to: search_path(conn, :index)
  end
end
